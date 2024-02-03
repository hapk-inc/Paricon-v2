import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../logic/auth_provider.dart';
import '../logic/room_level_notifier.dart';
import '../logic/room_id.dart';
import '../logic/room_provider.dart';
import '../logic/room_type_notifier.dart';
import '../model/room.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

import '../theme/my_theme.dart';

class HostRoom extends ConsumerWidget {
  const HostRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      sGameStartProvider.select((data) => data.value ?? false),
      (previous, next) {
        if (next) {
          context.router.push(const PlayFriendRoute());
        }
      },
    );

    final User? user = ref.watch(authUserProvider).value;
    final Room? room = ref.watch(roomProvider).when(
        data: (x) => x,
        error: (e, s) {
          debugPrintStack(stackTrace: s);
          return null;
        },
        loading: () => null);
    final pTheme = SlidingPanelTheme();
    return ListView(
      padding: pTheme.slidingPanelPadding,
      children: [
        ListTile(
          dense: true,
          tileColor: xantHous,
          horizontalTitleGap: 0,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          leading: AnimatedFlipCounter(
            value: room == null ? 0 : room.roomCode,
            wholeDigits: 6,
            duration: const Duration(milliseconds: 1200),
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30.r,
              color: federalBlue,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5.r,
            ),
          ),
          trailing: room == null
              ? null
              : SizedBox(
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (user != null)
                        Flexible(
                          child: IconButton(
                            icon: Icon(
                              Icons.done,
                              size: 27.r,
                              color: cornellRed,
                            ),
                            onPressed: user.uid == room.creatorID &&
                                    room.players.length > 1
                                ? () =>
                                    ref.watch(createBoardProvider.future).then(
                                      (created) {
                                        debugPrint("Created $created");
                                        if (created) {
                                          ref.read(gameStartProvider);
                                        }
                                      },
                                    )
                                : () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: richBlack,
                                        content: Text(user.uid != room.creatorID
                                            ? "Ask ${room.players[room.creatorID]['name']} to start the game"
                                            : "Need atleast 2 players to start the game."),
                                      ),
                                    ),
                          ),
                        ),
                      Flexible(
                        child: IconButton(
                          icon: Icon(Icons.close, size: 27.r, color: gray),
                          onPressed: () =>
                              ref.read(leaveRoomProvider.future).whenComplete(
                                    () => ref.read(idNotifier.notifier).empty(),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        if (room != null) ...[
          if (room.players.containsKey(room.creatorID))
            FadeIn(
              child: AutoSizeText(
                "${user!.uid == room.creatorID ? "You" : room.players[room.creatorID]['name']}"
                " created this room. "
                "Share the code with your friends",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.r,
                  height: 2.1.r,
                  fontWeight: FontWeight.w300,
                  color: federalBlue,
                ),
                maxFontSize: 15,
                minFontSize: 9,
                maxLines: 1,
              ),
            ),
          Gap(15.r),
          FadeIn(
            child: Container(
              height: 105.h,
              //  margin: EdgeInsets.symmetric(vertical: 24.r),
              width: 330.w,
              decoration: BoxDecoration(
                color: lavenderWeb,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.5.r),
                child: LayoutBuilder(
                  builder: (_, c) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: room.players.entries.map(
                        (e) {
                          String id = e.key;
                          Map map = e.value as Map;
                          return HostRoomPlayerTile(id, map);
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
            ),
          ),
          Gap(15.r),
          FadeIn(
            child: Container(
              decoration: BoxDecoration(
                color: lavenderWeb,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              height: 150.h,
              width: 330.w,
              child: LayoutBuilder(
                builder: (_, c1) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(3.r),
                    ToggleSwitch(
                      radiusStyle: true,
                      labels: List.from(
                          RoomLevel.values.map((e) => firstCaps(e.name))),
                      customWidths: [75.w, 105.w, 75.w],
                      minHeight: 36.h,
                      changeOnTap: false,
                      initialLabelIndex:
                          RoomLevel.values.indexWhere((x) => x == room.level),
                      /*onToggle: (index) => ref
                          .read(levelProvider.notifier)
                          .state = RoomLevel.values[index!],*/
                      inactiveBgColor: lavenderWeb,
                      inactiveFgColor: charcoal,
                      activeBgColor: const [tropicalIndigo],
                      animate: true,
                      animationDuration: 150,
                      dividerColor: ghostWhite,
                      dividerMargin: 1.2.r,
                      customTextStyles: [
                        TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.r,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Gap(30.r),
                    ToggleSwitch(
                      changeOnTap: false,
                      radiusStyle: true,
                      labels: List.from(
                        RoomType.values.map((e) => firstCaps(e.name)),
                      ),
                      customWidths: [105.w, 90.w, 120.w],
                      minHeight: 45.h,
                      initialLabelIndex:
                          RoomType.values.indexWhere((x) => x == room.type),
                      onToggle: null,
                      //onToggle: (index) => ref.read(typeProvider.notifier).state =
                      //    RoomType.values[index!],
                      inactiveBgColor: lavenderWeb,
                      inactiveFgColor: charcoal,
                      activeBgColor: const [federalBlue],
                      //animate: true,
                      animationDuration: 120,
                      dividerColor: ghostWhite,
                      dividerMargin: 1.2.r,
                      customTextStyles: [
                        TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.r,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}

class HostRoomPlayerTile extends ConsumerWidget {
  final String id;
  final Map map;
  const HostRoomPlayerTile(this.id, this.map, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room? room = ref.watch(roomProvider).value;
    final List<Color> xColor = ref.read(gridColorRandomColorProvider);
    return room == null
        ? Container()
        : FadeInRight(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: xColor[List.from(room.players.keys).indexOf(id)],
              width: 330.w / room.players.length,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    bottom: map.containsKey('avatar') ? -10.5.h : 7.5.h,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: map.containsKey('avatar')
                          ? FadeInUp(
                              child: RandomAvatar(
                                map['avatar'],
                                trBackground: true,
                                height: 330.w * 0.24,
                              ),
                            )
                          : Text(
                              map['name'],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
