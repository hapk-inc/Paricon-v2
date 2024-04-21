import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';

class MyDuration extends StatelessWidget {
  final Duration duration;

  const MyDuration(this.duration, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inMinutes,
              wholeDigits: 2,
              textStyle: GoogleFonts.russoOne(
                textStyle: TextStyle(
                  fontSize: 30.r,
                  height: 0,
                  fontWeight: FontWeight.w700,
                  color: ghostWhite,
                ),
              ),
            ),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: 18.r)),
          TextSpan(
            text: ":",
            style: TextStyle(fontSize: 24.r),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: 18.r)),
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inSeconds % 60,
              wholeDigits: 2,
              textStyle: GoogleFonts.russoOne(
                textStyle: TextStyle(
                  fontSize: 30.r,
                  height: 0,
                  fontWeight: FontWeight.w700,
                  color: ghostWhite,
                ),
              ),
            ),
          ),
          TextSpan(text: " ", style: TextStyle(fontSize: 18.r)),
          WidgetSpan(
            child: AnimatedFlipCounter(
              value: duration.inMilliseconds % 1000,
              padding: EdgeInsets.only(bottom: 3.6.r),
              wholeDigits: 3,
              textStyle: GoogleFonts.russoOne(
                textStyle: TextStyle(
                  fontSize: 15.r,
                  height: 0,
                  fontWeight: FontWeight.w700,
                  color: ghostWhite,
                ),
              ),
            ),
          ),
        ],
        style: GoogleFonts.russoOne(
          textStyle: TextStyle(
            fontSize: 30.r,
            height: 0,
            fontWeight: FontWeight.w700,
            color: ghostWhite,
          ),
        ),
      ),
    );
  }
}
