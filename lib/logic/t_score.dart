import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextSpan showTScore(
  Duration duration, {
  required Color minute,
  required Color mm,
  double tSize = 12,
  double sSize = 9,
  String family = 'Montserrat',
}) =>
    TextSpan(
      children: [
        TextSpan(text: onlyMinute(duration)),
        TextSpan(text: " : ", style: TextStyle(fontSize: (tSize - 10).r)),
        TextSpan(text: onlySecond(duration)),
        TextSpan(text: " ", style: TextStyle(fontSize: (tSize - 4).r)),
        TextSpan(
          text: onlyMilli(duration),
          style: TextStyle(color: mm, fontSize: sSize.r),
        )
      ],
      style: TextStyle(
        fontFamily: family,
        color: minute,
        fontSize: tSize.r,
      ),
    );

String onlyMinute(Duration duration) =>
    duration.inMinutes.toString().padLeft(2, '0');

String onlySecond(Duration duration) =>
    "${duration.inSeconds % 60}".padLeft(2, '0');

/*String onlyMMSS(Duration duration) =>
    "${duration.inMinutes.toString().padLeft(2, '0').padLeft(2, '0')}"
    " : ${"${duration.inSeconds % 60}".padLeft(2, '0')}";*/

String onlyMilli(Duration duration) => "${duration.inMilliseconds % 1000}";
