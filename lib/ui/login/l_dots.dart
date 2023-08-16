import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/login_theme.dart';

class LDots extends StatelessWidget {
  const LDots(
      {super.key,
      required this.theme,
      this.bigR = 12,
      this.smallR = 9.6,
      this.space = 9});

  final LoginTheme theme;
  final num bigR;
  final num smallR;
  final num space;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: 1,
      decorator: DotsDecorator(
        activeColor: theme.roundHighlight,
        color: theme.roundBg,
        activeSize: Size.square((bigR).w),
        size: Size.square((smallR).w),
        spacing: EdgeInsets.only(right: (space).w),
      ),
    );
  }
}
