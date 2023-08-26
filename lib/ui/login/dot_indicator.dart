import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/dot_notifier.dart';
import 'login_theme.dart';

class LoginDot extends ConsumerWidget {
  const LoginDot(
      {super.key, this.bigR = 10.5, this.smallR = 9, this.space = 9});

  final double bigR;
  final double smallR;
  final double space;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dot = ref.watch(dotNotifierProvider);
    return DotsIndicator(
      dotsCount: 2,
      position: dot.toDouble(),
      onTap: (position) {
        ref.read(dotNotifierProvider.notifier).state = position.round();
      },
      decorator: DotsDecorator(
        activeColor: lTheme.roundHighlight,
        color: lTheme.roundBg,
        activeSize: Size.square(bigR.sp),
        size: Size.square(smallR.sp),
        spacing: EdgeInsets.only(right: space.w),
      ),
    );
  }
}
