import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../logic/tournament_listener.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

class TButton extends ConsumerWidget {
  const TButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 9.6.h,
      child: Stack(
        children: [
          Positioned(
            top: 18.r,
            bottom: 3.r,
            left: 0,
            right: 60.r,
            child: Container(
              decoration: BoxDecoration(
                color: denim,
                borderRadius: BorderRadius.circular(6.r),
              ),
              padding: EdgeInsets.all(9.r),
              margin: EdgeInsets.only(right: 24.w, left: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Open Challenge",
                    style: TextStyle(
                      fontFamily: 'WendyOne',
                      fontSize: 30.r,
                      color: ghostWhite,
                    ),
                  ),
                  Gap(15.r),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(tournamentListenerNotifierProvider);
                          context.router.push(const TournamentRoute());
                        },
                        style: ButtonStyle(
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: ghostWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.5.r,
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 15.r)),
                          backgroundColor:
                              const MaterialStatePropertyAll(jasper),
                        ),
                        child: const Text(
                          "PLAY NOW",
                          style: TextStyle(color: ghostWhite),
                        ),
                      ),
                      /*OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              width: 0.6.r,
                              color: charcoal,
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 18.w),
                          ),
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3.r,
                              color: charcoal,
                              fontSize: 13.5.r,
                            ),
                          ),
                        ),
                        child: const Text(
                          "VIEW LEADERBOARD",
                          style: TextStyle(color: charcoal),
                        ),
                      ),*/
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: -60.r,
            top: -15.r,
            bottom: -15.r,
            child: Lottie.asset('lottie/trophies.json', repeat: false),
          ),
        ],
      ),
    );
  }
}
