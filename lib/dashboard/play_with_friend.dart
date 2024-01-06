import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/logic/panel_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/room_level_notifier.dart';
import '../logic/room_provider.dart';
import '../logic/room_type_notifier.dart';
import '../my_widget/enter_avatar_pinput.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PlayWithFriend extends ConsumerWidget {
  const PlayWithFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 13.2.h,
      child: Stack(
        children: [
          Positioned(
            top: 12.r,
            //bottom: 3.r,
            left: 0.r,
            right: 0.r,
            child: Container(
              height: 180.h,
              decoration: BoxDecoration(
                color: jasper,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.only(top: 12.r, left: 15.r),
              margin: EdgeInsets.only(right: 24.w, left: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Play with Friends",
                    style: TextStyle(
                      fontFamily: 'WendyOne',
                      fontSize: 36.r,
                      color: magnolia,
                    ),
                  ),
                  AutoSizeText(
                    "Max up to 4 players",
                    style: TextStyle(
                      fontSize: 12.r,
                      color: ghostWhite,
                      fontFamily: 'Montserrat',
                      // height: 2.1.r,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Gap(15.r),
                  const PlayOnlineButton(),
                ],
              ),
            ),
          ),
          Positioned(
            right: -30.r,
            top: -15.r,
            bottom: -15.r,
            child: Lottie.asset('lottie/friends-playing.json', repeat: true),
          ),
        ],
      ),
    );
  }
}

class PlayOnlineButton extends ConsumerWidget {
  const PlayOnlineButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: [PlayOnlineElevatedButton()],
    );
  }
}

class PlayOnlineElevatedButton extends ConsumerWidget {
  const PlayOnlineElevatedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool goToPlayOnline = ref.watch(showPlayOnlineProvider);

    return ElevatedButton(
      onPressed: !goToPlayOnline
          ? () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: charcoal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  padding: EdgeInsets.only(left: 12.r),
                  margin: EdgeInsets.only(bottom: 0, left: 12.w, right: 12.w),
                  content: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 45.h,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    child: AutoSizeText(
                      "Still in Progress. Appreciate your patience till then",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.r,
                        color: ghostWhite,
                        letterSpacing: 0.12.r,
                      ),
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 15,
                    ),
                  ),
                ),
              )
          : () {
              ref.read(dPanelWidgetProvider.notifier).state =
                  const CreateGamePanel();
              ref.read(dashboardPanelProvider).open();
            },
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 13.5.r,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5.r),
          ),
        ),
        padding:
            MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15.r)),
        backgroundColor: const MaterialStatePropertyAll(denim),
      ),
      child: const Text(
        "PLAY ONLINE",
        style: TextStyle(color: ghostWhite),
      ),
    );
  }
}

class CreateGamePanel extends ConsumerWidget {
  const CreateGamePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slidingPanelTheme = SlidingPanelTheme();
    return Container(
      decoration: BoxDecoration(
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        color: magnolia,
      ),
      padding: slidingPanelTheme.slidingPanelPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleSwitch(
            radiusStyle: true,
            labels: List.from(RoomLevel.values.map((e) => firstCaps(e.name))),
            customWidths: [90.w, 105.w, 90.w],
            minHeight: 45.h,
            onToggle: (index) {
              ref.read(levelProvider.notifier).state = RoomLevel.values[index!];
            },
            // customHeights: [60.h],
            inactiveBgColor: magnolia,
            inactiveFgColor: charcoal,
            activeBgColor: const [tropicalIndigo],
            animate: true,
            animationDuration: 150,
            dividerColor: ghostWhite,
            dividerMargin: 1.2.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15.r,
              ),
            ],
          ),
          Gap(30.r),
          ToggleSwitch(
            radiusStyle: true,
            labels: List.from(RoomType.values
                .map((e) => toBeginningOfSentenceCase(e.name) ?? "")),
            customWidths: [108.w, 90.w, 108.w],
            customHeights: [60.h],
            onToggle: (index) {
              ref.read(typeProvider.notifier).state = RoomType.values[index!];
            },
            inactiveBgColor: magnolia,
            inactiveFgColor: charcoal,
            activeBgColor: const [tropicalIndigo],
            animate: true,
            animationDuration: 150,
            dividerColor: ghostWhite,
            dividerMargin: 1.2.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15.r,
              ),
            ],
          ),
          Gap(30.r),
          ButtonBar(
            buttonMinWidth: 132.h,
            // buttonHeight: 48.h,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(createRoomProvider.future).then(
                    (value) {
                      debugPrint("Create Room Done");
                      ref.read(joinRoomProvider.future).catchError((e, s) {
                        debugPrint("244-- $e");
                        debugPrintStack(stackTrace: s);
                      });
                    },
                  ).whenComplete(
                    () {
                      debugPrint("Create Room whenComplete");

                      ref.read(dashboardPanelProvider).close();
                      context.router.push(const HostRoomRoute());
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(chocolateCosmos),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                  ),
                ),
                child: AutoSizeText(
                  "Create Game".toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: ghostWhite,
                    fontSize: 15.r,
                  ),
                  maxLines: 1,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  ref.watch(dPanelHeightProvider.notifier).state = 450.h;
                  ref.watch(dPanelWidgetProvider.notifier).state =
                      const EnterRoomCode();
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                  ),
                  side: MaterialStatePropertyAll(
                    BorderSide(color: majorelleBlue, width: 0.3.r),
                  ),
                ),
                child: AutoSizeText(
                  "Enter Room Code".toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: amaranthPurple,
                    fontSize: 15.r,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EnterRoomCode extends StatelessWidget {
  const EnterRoomCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Column(
        children: [
          Gap(30.r),
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
          EnterAvatarCodePinPut(),
        ],
      ),
    );
  }
}
