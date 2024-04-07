import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../logic/board/notifier.dart';
import '../../values/colors.dart';

class IconTimer extends ConsumerWidget {
  const IconTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardNotifier = ref.watch(boardNotifierProvider);
    final Duration duration = boardNotifier.stopwatch.elapsed;

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(Icons.timer, size: 30.r, color: charcoal),
              SizedBox.square(dimension: 7.5.r),
              AnimatedFlipCounter(
                value: duration.inMinutes,
                suffix: " : ",
                wholeDigits: 2,
                textStyle: textTheme.displayLarge,
              ),
              SizedBox.square(dimension: 1.5.r),
              AnimatedFlipCounter(
                value: duration.inSeconds % 60,
                wholeDigits: 2,
                textStyle: textTheme.displayLarge,
              ),
              const Spacer(),
              InkWell(
                onTap: () => context.router.maybePop(),
                child: Icon(Icons.close, size: 18.r, color: gray),
              ),
              SizedBox.square(dimension: 7.5.r),
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
                end: boardNotifier.percentageFound,
                //end: mockInteger(1, 100) * 0.01,
              ),
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                color: majorelleBlue,
                backgroundColor: frenchGray,
                minHeight: 4.5.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
