import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';

class IconTimer extends ConsumerWidget {
  const IconTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(Icons.timer, size: 30.r, color: charcoal),
              SizedBox.square(dimension: 7.5.r),
              AnimatedFlipCounter(
                value: mockInteger(1, 50),
                //value: gameDuration.inMinutes,
                suffix: " : ",
                wholeDigits: 2,
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: isP ? 18.r : 21.r,
                  color: cornellRed,
                  //color: amaranthPurple,
                  letterSpacing: 0.075.r,
                ),
              ),
              SizedBox.square(dimension: 1.5.r),
              AnimatedFlipCounter(
                value: mockInteger(1, 50),
                //value:
                //    gameDuration.inSeconds % 60,
                wholeDigits: 2,
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: isP ? 18.r : 21.r,
                  color: cornellRed,
                  letterSpacing: 0.075.r,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => context.router.maybePop(),
                child: Icon(Icons.close, size: 21.r),
              ),
              Gap(15.r)
            ],
          ),
          Gap(15.r),
          ClipRRect(
            borderRadius: BorderRadius.circular(3.r),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                // end: tournamentListener.balancePercentage,
                end: mockInteger(1, 100) * 0.01,
              ),
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                color: majorelleBlue,
                backgroundColor: aquamarine,
                minHeight: 4.5.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
