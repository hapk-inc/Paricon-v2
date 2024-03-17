import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import '../logic/dashboard_provider.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/room_id.dart';
import '../logic/room_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/room.dart';
import '../my_widget/login_option_button.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'game_room.dart';

/*final SlidingPanelTheme _pTheme = SlidingPanelTheme();

const String _prompt = 'Give a different line for line "created this room. '
    'Share the room code with your friends and start playing" '
    'in easy english in the same order.'
    'Also starts with lower case because it starts with the person name.
    Dont start with you and and make it in single line. I need to show this in my app';*/

class HostRoom extends ConsumerStatefulWidget {
  const HostRoom({super.key});

  @override
  ConsumerState createState() => _HostRoomState();
}

class _HostRoomState extends ConsumerState<HostRoom> {
  late Room? room;
  num roomCode = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        setState(() {
          roomCode = room?.roomCode ?? 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      sGameStartProvider.select((data) => data.value ?? false),
      (previous, next) {
        if (next) {
          context.router.push(const PlayFriendRoute());
        }
      },
    );

    final User? user = ref.watch(authUserProvider).value;
    room = ref.watch(roomProvider).value;
    if (room == null || user == null) return Container();

    final String creatorName = room == null
        ? ""
        : (room?.players ?? {}).isEmpty
            ? ""
            : room?.players[room?.creatorID]['name'] ?? "";

    /*Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          roomCode = room?.roomCode ?? 1;
        });
      },
    );*/
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        //padding: _pTheme.slidingPanelPadding,
        child: Column(
          children: [
            Gap(15.r),
            AspectRatio(
              aspectRatio: 3.6,
              child: GridTileBar(
                //backgroundColor: cornellRed,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedFlipCounter(
                      value: roomCode,
                      mainAxisAlignment: MainAxisAlignment.start,
                      prefix: "#",
                      wholeDigits: 6,
                      duration: const Duration(milliseconds: 1200),
                      textStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.r,
                        color: vanDyke,
                        letterSpacing: 0.3.r,
                      ),
                    ),
                    LoginOptionButton(
                      optionBtnPressed: () =>
                          ref.read(leaveRoomProvider.future).whenComplete(
                                () => ref.read(idNotifier.notifier).empty(),
                              ),
                      lChild: Icon(Icons.close, size: 24.r, color: frenchGray),
                      bColor: ghostWhite1,
                    ),
                  ],
                ),
                // subtitleTextStyle: tTheme.bodySmall,
                subtitle: AutoSizeText(
                  "$creatorName${ref.read(roomCreatorProvider)}",
                  maxLines: 2,
                  style:
                      settingSubText.copyWith(color: vanDyke, fontSize: 13.5.r),
                  // style: tTheme.bodySmall?.copyWith(color: gray),
                ),
              ),
            ),
            Gap(15.r),
            Container(
              //height: 45.h + (48.h * (room?.players.length ?? 0)),
              height: 195.h,
              width: 360.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              color: lavenderWeb1,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: ["Name", "Matches", "Avg. Score"]
                        .map(
                          (e) => Container(
                            // margin: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.centerLeft,
                            height: 45.h,
                            child: Text(
                              e,
                              style: tableTextStyle.copyWith(color: gray),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  ...(room?.players ?? {}).entries.map(
                    (e) {
                      final map = e.value as Map;
                      final MyUser? myUser =
                          ref.watch(xUserProvider(e.key)).value;
                      debugPrint(map.toString());
                      return TableRow(
                        key: ValueKey(e.key),
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 48.h,
                            child: Row(
                              children: [
                                if (myUser?.avatar != null) ...[
                                  CircleAvatar(
                                    radius: 15.r,
                                    child: RandomAvatar(
                                        myUser?.avatar ?? mockString(1)),
                                  ),
                                  Gap(7.5.r),
                                ],
                                AutoSizeText(
                                  map['name'],
                                  style: tableTextStyle.copyWith(
                                      color: amaranthPurple),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 48.h,
                            child: Text("${mockInteger(1, 10)}",
                                style: tableTextStyle),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 48.h,
                            child: Text(
                                "${mockInteger(10, 20)}.${mockInteger(10, 20)}",
                                style: tableTextStyle),
                          ),
                        ],
                      );
                    },
                  )
                ],
                /* columns: [
                  DataColumn(label: Text("ll")),
                  DataColumn(label: Text("ll")),
                  DataColumn(label: Text("ll")),
                ],
                rows: [],*/
              ),
            ),
            SizedBox(height: 150.h, child: const CreateRoom()),
            ButtonBar(
              buttonPadding: EdgeInsets.symmetric(horizontal: 15.w),
              children: [
                OutlinedButton(
                  onPressed: kDebugMode ||
                          (user.uid == room?.creatorID &&
                              room!.players.length > 1)
                      ? () => ref.watch(createBoardProvider.future).then(
                            (created) {
                              debugPrint("Created $created");
                              if (created) {
                                ref.read(gameStartProvider);
                              }
                            },
                          )
                      : () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: richBlack,
                              content: Text(user.uid != room?.creatorID
                                  ? "Ask ${room?.players[room?.creatorID]['name']} to start the game"
                                  : "Need atleast 2 players to start the game."),
                            ),
                          ),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5.r)),
                    ),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: gray, width: 0.75.r),
                    ),
                  ),
                  child: const Text(
                    "START GAME",
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            )
            /* FadeIn(
              delay: const Duration(milliseconds: 300),
              child: Container(
                height: 135.h,
                decoration: BoxDecoration(
                    color: room == null || (room?.players ?? {}).isEmpty
                        ? null
                        : tropicalIndigo,
                    borderRadius: BorderRadius.circular(3.r)),
                margin: EdgeInsets.symmetric(vertical: 7.5.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.r),
                  child: LayoutBuilder(
                    builder: (_, box) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, int index) => RoomPTile(index),
                      //addAutomaticKeepAlives: false,
                      //   separatorBuilder: (_, __) => const RoomDivider(),
                      itemCount: room?.players.length ?? 0,
                    ),
                  ),
                ),
              ),
            ),
            Gap(7.5.r),
            FadeIn(
              delay: const Duration(milliseconds: 300),
              child: Container(
                height: 156.h,
                alignment: Alignment.center,
                //color: lavenderWeb1,
                child: const CreateRoom(),
              ),
            ),
            Gap(24.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(federalBlue),
                  minimumSize: MaterialStatePropertyAll(Size(300.w, 48.h)),
                  side: MaterialStatePropertyAll(
                    BorderSide(width: 0.45.r, color: darkGreen),
                  ),
                ),
                onPressed: kDebugMode ||
                        (user.uid == room?.creatorID &&
                            room!.players.length > 1)
                    ? () => ref.watch(createBoardProvider.future).then(
                          (created) {
                            debugPrint("Created $created");
                            if (created) {
                              ref.read(gameStartProvider);
                            }
                          },
                        )
                    : () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: richBlack,
                            content: Text(user.uid != room?.creatorID
                                ? "Ask ${room?.players[room?.creatorID]['name']} to start the game"
                                : "Need atleast 2 players to start the game."),
                          ),
                        ),
                child: Text(
                  "CLICK HERE TO START",
                  style: TextStyle(
                    color: ghostWhite1,
                    fontSize: 13.5.r,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

/*
class RoomPTile extends ConsumerWidget {
  final int index;
  const RoomPTile(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room? room = ref.watch(roomProvider).value;
    final User? user = ref.watch(authUserProvider).value;
    final MyUser? myUser = ref.watch(myUserProvider).value;

    if (room == null) return Container();
    debugPrint(room.toString());
    if (room.players.isEmpty) return Container();
    final Map players = room.players;
    final String? x = List.from(players.keys)[index];
    Map map = List.from(players.values)[index] as Map;
    if (x == null) return Container();
    final MyUser? xUser =
        x == user?.uid ? myUser : ref.watch(xUserProvider(x)).value;

    final TextTheme tTheme = Theme.of(context).textTheme;

    //final int timeStamp = map['timestamp'];
    final DateTime timeStamp = DateTime.parse(map['timestamp'].toString());
    final Duration diff = DateTime.now().difference(timeStamp);

    return LayoutBuilder(
      builder: (_, box) => Container(
        width: 120.w,
        color: index.isEven ? vanDyke : federalBlue,
        child: Stack(
          children: [
            Positioned(
              top: 15.r,
              left: 7.5.r,
              width: 108.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    map['name'],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.r,
                      color: ghostWhite1,
                    ),
                  ),
                  Gap(3.r),
                  AutoSizeText(
                    diff.inSeconds == 0
                        ? "Just now joined"
                        : diff.inMinutes == 0
                            ? "Few minutes before"
                            : "Joined ${diff.inMinutes == 1 ? "a minute" : "${diff.inMinutes} minutes"} ago",
                    // map['timestamp'].toString(),
                    style: tTheme.bodySmall?.copyWith(
                        color: ghostWhite, fontWeight: FontWeight.w200),
                    maxLines: 1,
                  )
                ],
              ),
            ),
            if (xUser?.avatar != null)
              Positioned.fill(
                bottom: -45.r,
                left: 15.r,
                right: 15.r,
                child: SlideInUp(
                    child: RandomAvatar(mockString(1), trBackground: true)),
              )
          ],
        ),
      ),
    );
  }
}
*/

/*
class RoomDivider extends StatelessWidget {
  const RoomDivider({super.key});

  @override
  Widget build(BuildContext context) => VerticalDivider(
        width: 0,
        indent: 30.h,
        thickness: 1.2.r,
      );
}
*/

/*class RoomPlayerTile extends StatelessWidget {
  const RoomPlayerTile({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            top: 15.r,
            left: 9.r,
            width: 105.w,
            child: Text(
              mockAvatarName(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13.5.r,
                color: ghostWhite1,
              ),
            ),
          ),
          Positioned.fill(
            bottom: -30.r,
            left: 18.r,
            right: 18.r,
            child: RandomAvatar(mockString(1), trBackground: true),
          )
        ],
      );
}*/

// "${user!.uid == room?.creatorID ? "You" : room.players[room.creatorID]['name']}"
//" created this room. "
//"Share the room code with your friends",

//made this room. share the room code with your friends and get playing
//created this room. share the room code with your friends to start playing
//created this room. share the room code with your friends and start playing.
//created this room. share the code with friends and play
//, you created this room. tell your friends the room code to start playing
// created this room, share the code with your friends and let's play

TextStyle get tableTextStyle => TextStyle(
      fontSize: 13.5.r,
      color: richBlack,
      fontFamily: 'Montserrat',
    );
