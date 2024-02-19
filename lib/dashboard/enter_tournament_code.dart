import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/next_animation_flag.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

const List<String> _animText = ['PLAY NOW', 'TRY NOW', 'START NOW'];

class EnterTournamentCode extends ConsumerWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repeatAnimationNotifier = ref.watch(repeatAnimationNotifierProvider);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      height: 48.r,
      decoration: BoxDecoration(
        color: cinerous,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.5.r),
        child: Row(
          children: [
            Container(
              width: 225.w,
              color: magnolia1,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: InkWell(
                onTap: () {
                  context.router.push(const ViewTournamentRoute());
                  /* ref.read(dashboardPanelNotifierProvider).openBuilder =
                            TournamentCodeOpen(action);
                        action.call();*/
                },
                child: Text(
                  "PARICON",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.r,
                    letterSpacing: 0.45.r,
                    fontWeight: FontWeight.w400,
                    color: vanDyke.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => context.router.push(const TournamentRoute()),
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ghostWhite,
                      fontSize: 13.5.r,
                      fontWeight: FontWeight.w700,
                    ),
                    child: AnimatedTextKit(
                      onTap: () => context.router.push(const TournamentRoute()),
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
                      pause: repeatAnimationNotifier.animDuration,
                      /*onNext: (index, flag) {

                      },*/
                      onNextBeforePause: (index, p1) {
                        debugPrint(_animText[index]);
                        debugPrint(
                            "Duration - ${repeatAnimationNotifier.animDuration.inSeconds}");
                        repeatAnimationNotifier.animDuration =
                            Duration(seconds: mockInteger(5, 15));
                        repeatAnimationNotifier.index = index;
                        repeatAnimationNotifier.repeatAnimation =
                            !repeatAnimationNotifier.repeatAnimation;
                      },
                      repeatForever: true,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
