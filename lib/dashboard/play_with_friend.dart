import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

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
                          if (goToPlayOnline) {
                            context.router.push(const HostRoomRoute());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: charcoal,
                                padding: EdgeInsets.only(left: 15.w, top: 15.h),
                                content: AutoSizeText(
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
                            );
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
