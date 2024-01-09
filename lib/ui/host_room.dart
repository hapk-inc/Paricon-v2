import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/dashboard_panel_provider.dart';
import 'package:paricon/logic/panel_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/room_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/room.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class HostRoomPage extends ConsumerWidget {
  const HostRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      sGameStartProvider.select((data) => data.value ?? false),
      (previous, next) {
        if (next) {
          context.router.replace(const PlayFriendRoute());
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 18.r),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        toolbarHeight: 72.h,
        title: const AutoSizeText(
          "Play with Friends/Family",
          style: TextStyle(color: ghostWhite),
        ),
      ),
      body: Container(),
    );
  }
}

class RoomCodePinPut extends StatefulWidget {
  final String? roomCode;
  const RoomCodePinPut(this.roomCode, {super.key});

  @override
  State<RoomCodePinPut> createState() => _RoomCodePinPutState();
}

class _RoomCodePinPutState extends State<RoomCodePinPut> {
  final focusNode = FocusNode();

  late TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.roomCode);
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = darkPastelGreen;
    const errorColor = chocolateCosmos;
    Color fillColor = magnolia;
    final defaultPinTheme = PinTheme(
      width: 54.r,
      height: 54.r,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24.r,
        color: federalBlue,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Container(
      height: 75.h,
      alignment: Alignment.centerLeft,
      //color: chocolateCosmos,
      child: Pinput(
        enabled: false,
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin == '555555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 75.r,
          width: 60.r,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(9.r),
          ),
        ),
      ),
    );
  }
}

class HostRoom extends ConsumerWidget {
  const HostRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room? room = ref.watch(roomProvider).value;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? user = ref.watch(authUserProvider).value;

    final tTheme = Theme.of(context).textTheme.titleLarge;

    ref.listen(
      sGameStartProvider.select((data) => data.value ?? false),
      (previous, next) {
        if (next) {
          context.router.push(const PlayFriendRoute());
        }
      },
    );

    final slidingTheme = SlidingPanelTheme();
    return Container(
      padding: slidingTheme.slidingPanelPadding,
      alignment: Alignment.topCenter,
      child: room == null || myUser == null || user == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 54.h,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Share the room code with your friends to join",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0,
                        fontSize: 12.r,
                        color: gray,
                        fontWeight: FontWeight.w300,
                      ),
                      minFontSize: 12,
                      maxFontSize: 15,
                      maxLines: 1,
                    ),
                  ),
                  RoomCodePinPut("${room.roomCode}"),
                  Gap(9.r),
                  SizedBox(
                    height: 300.h,
                    child: LayoutBuilder(
                      builder: (_, constraint) => Stack(
                        children: [
                          Positioned(
                            left: constraint.maxWidth * 0.015,
                            top: constraint.maxHeight * 0.15,
                            width: 300.w,
                            height: constraint.maxHeight * 0.45,
                            child: Container(
                              decoration: BoxDecoration(
                                color: magnolia,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 7.5.w,
                                        ),
                                        leading: CircleAvatar(
                                          backgroundColor: federalBlue,
                                          radius: 30.r,
                                          child: room.creatorID == user.uid
                                              ? myUser.avatar != null
                                                  ? RandomAvatar(myUser.avatar!)
                                                  : Text(
                                                      myUser.name
                                                          .substring(0, 2)
                                                          .toUpperCase(),
                                                      style: tTheme!.copyWith(
                                                        color: lightOrange,
                                                        fontSize: 24.r,
                                                        fontFamily: "WendyOne",
                                                      ),
                                                    )
                                              : RandomAvatar(mockString()),
                                        ),
                                        title: AutoSizeText(
                                          room.creatorID == user.uid
                                              ? "${myUser.name} created the room"
                                              : "Someone created this room",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.r,
                                            fontWeight: FontWeight.w900,
                                            color: richBlack,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        subtitle: Container(
                                          height: 24.h,
                                          // color: Colors.indigo,
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            "${toBeginningOfSentenceCase(room.level.name) ?? ""}  |  ${toBeginningOfSentenceCase(room.type.name) ?? ""}",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0,
                                              fontSize: 12.r,
                                              color: gray,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            maxLines: 1,
                                            minFontSize: 9,
                                            maxFontSize: 12,
                                          ),
                                        ),
                                        isThreeLine: true,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 6.w,
                            bottom: constraint.maxHeight * 0.12,
                            width: 300.w,
                            height: constraint.maxHeight * 0.39,
                            child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              elevation: 3.r,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9.r),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        color: lightColors[0],
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        color: lightColors[1],
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        color: lightColors[2],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: constraint.maxWidth * 0.03,
                            top: constraint.maxHeight * 0.06,
                            height: constraint.maxHeight * 0.12,
                            width: constraint.maxWidth * 0.45,
                            child: ElevatedButton(
                              onPressed: () =>
                                  ref.watch(createBoardProvider.future).then(
                                (created) {
                                  if (created) {
                                    ref.read(gameStartProvider);
                                    if (ref
                                        .watch(dashboardPanelProvider)
                                        .isPanelOpen) {
                                      ref
                                          .watch(dPanelHeightProvider.notifier)
                                          .state = 300.h;
                                      ref.watch(dashboardPanelProvider).close();
                                    }
                                  }
                                },
                              ),
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                  darkPastelGreen,
                                ),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.5.w),
                                  ),
                                ),
                              ),
                              child: AutoSizeText(
                                "Click here to Play",
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: magnolia,
                                  fontSize: 13.2.r,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
