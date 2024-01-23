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
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import '../ui/game_room.dart';
import '../ui/host_room.dart';

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
                    "Max up to 3 players",
                    style: TextStyle(
                      fontSize: 12.r,
                      color: ghostWhite,
                      fontFamily: 'Poppins',
                      // height: 2.1.r,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
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

SnackBar get _stillInProgress => SnackBar(
      backgroundColor: charcoal,
      padding: EdgeInsets.only(left: 12.r),
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
            fontWeight: FontWeight.w300,
            letterSpacing: 0.12.r,
          ),
          maxLines: 1,
          minFontSize: 12,
          maxFontSize: 15,
        ),
      ),
    );

class PlayOnlineElevatedButton extends ConsumerWidget {
  const PlayOnlineElevatedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool goToPlayOnline = ref.watch(showPlayOnlineProvider);

    return ElevatedButton(
      onPressed: !goToPlayOnline
          ? () => ScaffoldMessenger.of(context).showSnackBar(_stillInProgress)
          : () {
              /*ref.read(dPanelWidgetProvider.notifier).state =
                  const CreateGamePanel();*/
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
