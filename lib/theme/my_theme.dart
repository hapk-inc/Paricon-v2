import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'my_color.dart';

ThemeData get buildThemeData => ThemeData(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 30.r,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
            fontSize: 13.5.r,
            fontFamily: 'Cabin',
            letterSpacing: 0.12.r,
            height: 2.4,
            fontWeight: FontWeight.w400),
      ),
      snackBarTheme: SnackBarThemeData(
        insetPadding: EdgeInsets.symmetric(vertical: 15.h),
        contentTextStyle: TextStyle(
            color: ghostWhite,
            //fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
            fontSize: 15.r),
      ),
    );

class SlidingPanelTheme {
  double slidingPanelHeight = 210.h;
  EdgeInsets slidingPanelPadding = EdgeInsets.all(15.r);
  BorderRadius slidingPanelRadius =
      BorderRadius.vertical(top: Radius.circular(24.r));
  Color slidingPanelColor = ghostWhite;
  Color backDrop = richBlack;
}

String firstCaps(String s) => toBeginningOfSentenceCase(s) ?? "";
