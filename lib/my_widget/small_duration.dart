import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../values/colors.dart';

class SmallDuration extends StatelessWidget {
  final Duration duration;
  final Color color;
  final int size;
  final String family;
  const SmallDuration(
    this.duration, {
    this.color = mintGreen,
    this.size = 9,
    this.family = "Montserrat",
    super.key,
  });

  TextStyle get _textStyle => TextStyle(
        color: color,
        fontFamily: family,
        fontSize: size.r,
      );

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedFlipCounter(
            value: mockInteger(0, 1),
            wholeDigits: 1,
            suffix: " : ",
            textStyle: _textStyle,
          ),
          AnimatedFlipCounter(
            value: mockInteger(10, 50),
            wholeDigits: 2,
            suffix: " ",
            textStyle: _textStyle,
          ),
          AnimatedFlipCounter(
            value: mockInteger(100, 500),
            wholeDigits: 3,
            suffix: " ",
            textStyle: _textStyle.copyWith(fontSize: (size / 1.5).r),
          )
        ],
      );
}
