import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../values/colors.dart';

class SmallDuration extends StatelessWidget {
  final Duration duration;
  final Color color;
  const SmallDuration(this.duration, {this.color = mintGreen, super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedFlipCounter(
            value: mockInteger(0, 1),
            wholeDigits: 2,
            suffix: " : ",
            textStyle: TextStyle(color: color, fontFamily: 'RussoOne'),
          ),
          AnimatedFlipCounter(
            value: mockInteger(10, 50),
            wholeDigits: 2,
            suffix: " ",
            textStyle: TextStyle(color: color, fontFamily: 'RussoOne'),
          ),
          AnimatedFlipCounter(
            value: mockInteger(100, 500),
            wholeDigits: 3,
            suffix: " ",
            textStyle: TextStyle(
              fontSize: 9.r,
              color: color,
              fontFamily: 'RussoOne',
              letterSpacing: 0.3,
            ),
          )
        ],
      );
}
