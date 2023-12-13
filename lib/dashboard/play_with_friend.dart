import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/logic/dashboard_provider.dart';
import 'package:paricon/logic/panel_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../logic/remote_values.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

class PlayWithFriend extends ConsumerWidget {
  const PlayWithFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool goToPlayOnline = ref.watch(showPlayOnlineProvider);

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
                      color: magnolia,
                      fontFamily: 'Poppins',
                      height: 2.1.r,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Gap(15.r),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (!goToPlayOnline) {
                            context.router.push(const HostRoomRoute());
                          } else {
                            /*ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: charcoal,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                margin: const EdgeInsets.only(bottom: 0),
                                // margin: EdgeInsets.only(bottom: 0.h),
                                //padding: EdgeInsets.only(left: 15.w, top: 30.h),
                                content: Center(
                                  child: AutoSizeText(
                                    "Still in Progress. Appreciate your patience till then",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
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
                            );*/
                            // showModalBottomSheet(
                            //     context: context, builder: (_) => Container());
                            ref.read(dPanelWidgetProvider.notifier).state =
                                Container(
                              color: majorelleBlue,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.maxFinite,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      color: magnolia,
                                      borderRadius:
                                          BorderRadius.circular(7.5.r),
                                    ),
                                    child: ToggleSwitch(
                                      radiusStyle: true,
                                      labels: const ["Easy", "Medium", "Hard"],
                                      customWidths: [90.w, 108.w, 96.w],
                                      minHeight: 45.h,
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
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    alignment: Alignment.center,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      color: magnolia,
                                      borderRadius:
                                          BorderRadius.circular(7.5.r),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.5.r),
                                    child: ToggleSwitch(
                                      radiusStyle: true,
                                      labels: const [
                                        "Normal",
                                        "Closed",
                                        "OrderWise"
                                      ],
                                      customWidths: [108.w, 90.w, 108.w],
                                      customHeights: [60.h],
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
                                          fontSize: 13.5.r,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      //  panelController.open();
                                      context.router
                                          .push(const HostRoomRoute());
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              chocolateCosmos),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.5.r),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 54.h,
                                      //width: double.maxFinite,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Create Game",
                                        style: TextStyle(
                                          fontFamily: 'WendyOne',
                                          color: ghostWhite,
                                          fontSize: 21.r,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                            ref.read(dashboardPanelProvider).open();
                          }
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
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 15.r)),
                          backgroundColor:
                              const MaterialStatePropertyAll(denim),
                        ),
                        child: const Text(
                          "PLAY ONLINE",
                          style: TextStyle(color: ghostWhite),
                        ),
                      ),
                    ],
                  )
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
