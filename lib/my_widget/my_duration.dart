import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class MyDuration extends StatelessWidget {
  final Duration duration;
  final Color textColor;
  final String family;
  final double size;

  const MyDuration(this.duration,
      {this.textColor = charcoal,
      this.size = 30,
      this.family = "RussoOne",
      super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inMinutes,
              wholeDigits: 2,
              //padding: EdgeInsets.only(top: 3.6.r),
              textStyle: TextStyle(
                fontSize: size.r,
                height: 0,
                fontFamily: family,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: (size * 0.48).r)),
          TextSpan(
            text: ":",
            style: TextStyle(fontSize: (size * 0.9).r),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: (size * 0.48).r)),
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inSeconds % 60,
              wholeDigits: 2,
              //padding: EdgeInsets.only(top: 3.6.r),
              textStyle: TextStyle(
                fontSize: size.r,
                height: 0,
                fontFamily: family,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: (size * 0.54).r)),
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inMilliseconds % 1000,
              padding: EdgeInsets.only(bottom: 3.6.r),
              wholeDigits: 3,
              textStyle: TextStyle(
                fontSize: (size * 0.5).r,
                height: 0,
                fontFamily: family,
                fontWeight: FontWeight.w700,
                color: textColor.withOpacity(0.75),
              ),
            ),
          ),
        ],
        style: TextStyle(
          height: 0,
          fontSize: size.r,
          fontFamily: family,
          color: textColor,
        ),
      ),
    );
  }
}
