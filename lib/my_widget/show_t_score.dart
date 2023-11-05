import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextSpan showTScore(Duration duration,
    {required Color minute, required Color mm}) {
  return TextSpan(
    children: [
      TextSpan(
        text: "${duration.inMinutes.toString().padLeft(2, '0').padLeft(2, '0')}"
            " : ${"${duration.inSeconds}".padLeft(2, '0')} ",
      ),
      TextSpan(
        text: "${duration.inMilliseconds ~/ 100}",
        style: TextStyle(fontSize: 10.8.r, color: mm
            // color: isTScoreMine ? lightOrange : oldRose,
            ),
      )
    ],
    style: TextStyle(fontFamily: 'Montserrat', color: minute
        //color: isTScoreMine ? lightOrange : caputMortuum,
        ),
  );
}
