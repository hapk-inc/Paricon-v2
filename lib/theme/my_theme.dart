import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../logic/s_size.dart';
import 'my_color.dart';

//List<String> emojiArr = ["😁", "😍", "🤪", "😎", "😡", "🥺", "🤩", "😱", "🥶"];
/*List<AnimatedEmoji> animatedEmojiArr = [
  const AnimatedEmoji(AnimatedEmojis.smileWithBigEyes),
  const AnimatedEmoji(AnimatedEmojis.angry),
  const AnimatedEmoji(AnimatedEmojis.badminton),
  const AnimatedEmoji(AnimatedEmojis.rocket),
  const AnimatedEmoji(AnimatedEmojis.alien),
  const AnimatedEmoji(AnimatedEmojis.clown),
  const AnimatedEmoji(AnimatedEmojis.cupid),
  const AnimatedEmoji(AnimatedEmojis.cry),
  const AnimatedEmoji(AnimatedEmojis.volcano),
];*/

BorderRadius get bottomRadius => BorderRadius.only(
      bottomLeft: Radius.circular(15.r),
      bottomRight: Radius.circular(15.r),
    );

ThemeData buildThemeData(ScreenSize sSize) {
  final double appBarHeight = sSize == ScreenSize.phone
      ? 120.h
      : sSize == ScreenSize.tab
          ? 135.h
          : 108.h;
  final isSmallScreen = 900.h / 360.w > 2.3;
  return ThemeData(
    scaffoldBackgroundColor: ghostWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: majorelleBlue,
      titleTextStyle: TextStyle(
        color: ghostWhite1,
        fontFamily: 'WendyOne',
        fontSize: 27.r,
      ),
      //shape: RoundedRectangleBorder(borderRadius: bottomRadius),
      toolbarHeight: appBarHeight,
      elevation: 3.r,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 30.r,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 13.5.r,
        fontFamily: 'Poppins',
        letterSpacing: 0.12.r,
        height: 2.4,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: violetBlue,
        fontSize: 30.r,
        fontFamily: 'WendyOne',
        height: 1.5,
        letterSpacing: 0,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        fontSize: isSmallScreen ? 12.r : 9.r,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        height: 2.1,
        color: tropicalIndigo,
        letterSpacing: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 15.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15.w),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 15.r,
            fontFamily: 'Poppins',
            color: ghostWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(ghostWhite1),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5.r),
          ),
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      insetPadding: EdgeInsets.symmetric(vertical: 30.h),
      backgroundColor: darkPurple,
      contentTextStyle: TextStyle(
        color: ghostWhite1,
        fontFamily: 'Poppins',
        fontSize: 15.r,
      ),
      elevation: 3.r,
    ),
  );
}

class SlidingPanelTheme {
  //double slidingPanelHeight = 270.h;
  double slidingPanelHeight = 210.h;
  EdgeInsets slidingPanelPadding = EdgeInsets.all(15.r);
  BorderRadius slidingPanelRadius =
      BorderRadius.vertical(top: Radius.circular(24.r));
  BorderRadius slidingPanelFullRadius = BorderRadius.circular(15.r);
  Color slidingPanelColor = ghostWhite;
  Color backDrop = richBlack;
}

String firstCaps(String s) => toBeginningOfSentenceCase(s) ?? "";
