import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../enums/enums.dart';
import '../../../logic/app/game_match_bloc.dart';
import '../../../logic/leaderboard/notifier.dart';
import '../../../router/my_route.dart';
import '../../../values/colors.dart';

const List<String> _animText = ['PLAY NOW', 'TRY NOW', 'START NOW'];

class EnterTournamentCode extends ConsumerWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final LeaderBoardNotifier notifier = ref.watch(leaderBoardNotifierProvider);
    final me = notifier.me;
    final Duration? duration = me?.recordTimeTaken;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AspectRatio(
        aspectRatio: 4.5,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 15.w),
          title: Container(
            height: 60.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            padding: EdgeInsets.only(left: 15.w),
            decoration: BoxDecoration(
              color: lightOrange,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.5.r),
              child: Row(
                children: [
                  if (duration != null) ...[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${"${duration.inMinutes}".padLeft(2, '0')} :",
                          ),
                          TextSpan(
                            text:
                                " ${"${duration.inSeconds % 60}".padLeft(2, '0')} ",
                          ),
                          TextSpan(
                            text: "${duration.inMilliseconds % 1000}"
                                .padLeft(3, '0'),
                            style: textTheme.headlineMedium?.copyWith(
                              color: jasper,
                            ),
                          )
                        ],
                        style: textTheme.displayLarge?.copyWith(
                          color: cornellRed,
                        ),
                      ),
                    ),
                    /*AnimatedFlipCounter(
                      value: duration.inMinutes,
                      suffix: " :",
                      wholeDigits: 2,
                      textStyle:
                          textTheme.displayLarge?.copyWith(color: jasper),
                    ),
                    SizedBox.square(dimension: 1.5.r),
                    AnimatedFlipCounter(
                      value: duration.inSeconds % 60,
                      wholeDigits: 2,
                      textStyle:
                          textTheme.displayLarge?.copyWith(color: jasper),
                    ),
                    SizedBox.square(dimension: 1.5.r),
                    AnimatedFlipCounter(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      prefix: " ",
                      value: duration.inMilliseconds % 1000,
                      wholeDigits: 3,

                      textStyle: textTheme.headlineSmall?.copyWith(
                        color: jasper,
                      ),
                    ),*/
                  ] else ...[
                    Text(
                      "Play your First Game",
                      style: textTheme.bodyMedium?.copyWith(color: jasper),
                    )
                  ],
                  const Spacer(),
                  Container(
                    height: double.maxFinite,
                    alignment: Alignment.center,
                    color: jasper,
                    width: 120.w,
                    child: DefaultTextStyle(
                      style: textTheme.headlineLarge!.copyWith(
                        color: ghostWhite,
                        fontWeight: FontWeight.w900,
                      ),
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
                        repeatForever: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          subtitle: Container(
            height: 75.h,
            alignment: Alignment.centerLeft,
            child: Text(
              "This week . . .",
              //style: TextStyle(color: violetBlue),
              style: textTheme.titleSmall?.copyWith(color: jasper),
            ),
          ),
        ),
      ),
    );
  }
}
