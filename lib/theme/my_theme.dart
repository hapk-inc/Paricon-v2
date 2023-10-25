import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

ThemeData get buildThemeData => ThemeData(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 30.r,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
            fontSize: 12.r,
            fontFamily: 'Poppins',
            letterSpacing: 0.12.r,
            fontWeight: FontWeight.w300),
      ),
    );

class SlidingPanelTheme {
  double slidingPanelHeight = 210.h;
  EdgeInsets slidingPanelPadding = EdgeInsets.all(24.r);
  BorderRadius slidingPanelRadius =
      BorderRadius.vertical(top: Radius.circular(24.r));
  Color slidingPanelColor = ghostWhite;
}
