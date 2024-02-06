import 'package:animated_emoji/animated_emoji.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'my_color.dart';

List<String> emojiArr = ["😁", "😍", "🤪", "😎", "😡", "🥺", "🤩", "😱", "🥶"];
List<AnimatedEmoji> animatedEmojiArr = [
  const AnimatedEmoji(AnimatedEmojis.smileWithBigEyes),
  const AnimatedEmoji(AnimatedEmojis.angry),
  const AnimatedEmoji(AnimatedEmojis.badminton),
  AnimatedEmoji(AnimatedEmojis.rocket),
  const AnimatedEmoji(AnimatedEmojis.alien),
  const AnimatedEmoji(AnimatedEmojis.clown),
  const AnimatedEmoji(AnimatedEmojis.cupid),
  const AnimatedEmoji(AnimatedEmojis.cry),
  const AnimatedEmoji(AnimatedEmojis.volcano),
];

ThemeData get buildThemeData => ThemeData(
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
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
          color: violetBlue,
          fontSize: 30.r,
          fontFamily: 'WendyOne',
          height: 0,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontSize: 10.8.r,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          height: 2.4.r,
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
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 15.r,
              fontFamily: 'Poppins',
              color: ghostWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        insetPadding: EdgeInsets.symmetric(vertical: 15.h),
        contentTextStyle: TextStyle(
          color: ghostWhite,
          //fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          fontSize: 15.r,
        ),
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
