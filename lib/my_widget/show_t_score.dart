import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextSpan showTScore(Duration duration,
        {required Color minute, required Color mm}) =>
    TextSpan(
      children: [
        TextSpan(text: onlyMMSS(duration)),
        TextSpan(
          text: onlyMilli(duration),
          style: TextStyle(fontSize: 10.8.r, color: mm),
        )
      ],
      style: TextStyle(fontFamily: 'Montserrat', color: minute),
    );

String onlyMMSS(Duration duration) =>
    "${duration.inMinutes.toString().padLeft(2, '0').padLeft(2, '0')}"
    " : ${"${duration.inSeconds}".padLeft(2, '0')} ";

String onlyMilli(Duration duration) => "${duration.inMilliseconds ~/ 100}";
