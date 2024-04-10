import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paricon/enums/enums.dart';
import 'package:paricon/router/my_route.dart';

import '../../logic/app/game_match_bloc.dart';
import '../../values/colors.dart';

const List<String> _animText = ['PLAY NOW', 'TRY NOW', 'START NOW'];

class EnterTournamentCode extends ConsumerWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.only(left: 15.w),
        decoration: BoxDecoration(
          color: magnolia,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("PARICON"),
              Container(
                height: double.maxFinite,
                alignment: Alignment.center,
                color: jasper,
                width: 120.w,
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: ghostWhite),
                  child: AnimatedTextKit(
                    onTap: () {
                      ref.watch(matchNotifierProvider.notifier).state =
                          GameMatch.dailyMatch;
                      context.router.push(const PlayTournamentRoute());
                    },
                    animatedTexts: _animText
                        .map(
                          (e) => RotateAnimatedText(
                            e,
                            rotateOut: false,
                            transitionHeight: 30.r,
                            duration: const Duration(milliseconds: 300),
                          ),
                        )
                        .toList(),
                    isRepeatingAnimation: true,
                    pause: const Duration(seconds: 3),
                    // pause: repeatAnimationNotifier.animDuration,
                    /*onNext: (index, flag) {

                            },*/
                    /*onNextBeforePause: (index, p1) {
                      */ /*  debugPrint(_animText[index]);
                              debugPrint(
                                  "Duration - ${repeatAnimationNotifier.animDuration.inSeconds}");*/ /*
                      repeatAnimationNotifier.animDuration =
                          Duration(seconds: mockInteger(5, 15));
                      repeatAnimationNotifier.index = index;
                      repeatAnimationNotifier.repeatAnimation =
                          !repeatAnimationNotifier.repeatAnimation;
                    },*/
                    repeatForever: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
