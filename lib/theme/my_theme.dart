import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

final Provider<MyTheme> themeProvider =
    Provider<MyTheme>((ref) => MyTheme(ref));

enum ScreenSize { s, m, t, i, pc, tv, wide }

final Provider<ScreenSize> sizeProvider =
    Provider<ScreenSize>((ref) => MyTheme.screenSize);

class MyTheme {
  final Ref ref;

  MyTheme(this.ref);

  ThemeData get themeData => ThemeData(
        primaryColor: majorelleBlue,
        secondaryHeaderColor: Colors.pink,
        cardTheme: card,
        listTileTheme: listTile,
        dividerColor: frenchGray,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: ghostWhite,
        appBarTheme: appBar,
        elevatedButtonTheme: elevatedButton,
        iconButtonTheme: iconButton,
        textTheme: MyTextTheme.textTheme(screenSize),
      );

  static AppBarTheme get appBar => AppBarTheme(
        centerTitle: true,
        backgroundColor: majorelleBlue,
        iconTheme: IconThemeData(size: 21.r),
        titleTextStyle: MyFont.montserratTheme.copyWith(
          color: ghostWhite,
          fontSize: 18.r,
        ),
        //shape: RoundedRectangleBorder(borderRadius: bottomRadius),
        toolbarHeight: 120.h,
        elevation: 3.r,
      );

  static ScreenSize get screenSize {
    final double x = 900.h / 360.w;
    return x > 2.3
        ? ScreenSize.s
        : x > 2
            ? ScreenSize.m
            : x > 1.5
                ? ScreenSize.t
                : x > 1.2
                    ? ScreenSize.i
                    : x > 0.6
                        ? ScreenSize.pc
                        : x > 0.4
                            ? ScreenSize.tv
                            : ScreenSize.wide;
  }

  static ListTileThemeData get listTile {
    final textTheme = MyTextTheme.textTheme(screenSize);
    return ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      titleTextStyle: textTheme.titleLarge?.copyWith(color: violetBlue),
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
      iconColor: violetBlue,
    );
  }

  static CardTheme get card => CardTheme(
        margin: EdgeInsets.zero,
        color: ghostWhite,
        shadowColor: frenchGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 7.5.r,
      );

  static IconButtonThemeData get iconButton => IconButtonThemeData(
        style: ButtonStyle(
          iconSize: MaterialStatePropertyAll(24.r),
          iconColor: const MaterialStatePropertyAll(vanDyke),
        ),
      );

  static ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          foregroundColor: const MaterialStatePropertyAll(ghostWhite),
          textStyle: MaterialStatePropertyAll(
            MyFont.montserratTheme.copyWith(
              color: ghostWhite,
              fontSize: 16.r,
            ),
          ),
          elevation: MaterialStatePropertyAll(1.5.r),
          backgroundColor: const MaterialStatePropertyAll(violetBlue),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(48)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),
      );
}

mixin MyTextTheme {
  static TextTheme textTheme(ScreenSize screenSize) {
    final bool sm = screenSize == ScreenSize.s || screenSize == ScreenSize.m;

    return TextTheme(
      //title Font
      titleLarge: title.copyWith(fontSize: 30.r, height: sm ? 1.65 : 1.5),
      titleMedium: title.copyWith(fontSize: 24, height: 1.5),
      titleSmall: title.copyWith(fontSize: 21, height: 0.9),

      //bodyFonts
      bodyLarge: body.copyWith(fontSize: 24.r, height: 2.1),
      bodyMedium: body.copyWith(fontSize: 15.r, height: 1.8),
      bodySmall: body.copyWith(fontSize: 12.r, height: 1.8),

      //headLineFonts
      headlineLarge: headline.copyWith(fontSize: 15.r),
      headlineMedium: headline.copyWith(fontSize: 12.r),
      headlineSmall: headline.copyWith(fontSize: 9),

      //AnimatedFlipCounter
      displayLarge: headline.copyWith(fontSize: 18.r),

      //caption: bodyTheme.copyWith(fontSize: 12.r),
    );
  }

  static TextStyle get title => MyFont.wendyTheme;
  static TextStyle get body => MyFont.questrialTheme;

  static TextStyle get headline => MyFont.montserratTheme;
}

mixin MyFont {
  static TextStyle get wendyTheme => const TextStyle(
        fontFamily: 'WendyOne',
        letterSpacing: 0,
        height: 0,
        color: charcoal,
        fontSize: 14,
      );

  static TextStyle get questrialTheme => const TextStyle(
        fontFamily: 'Questrial',
        letterSpacing: 0,
        height: 0,
        fontSize: 14,
        color: gray,
      );

  static TextStyle get poppinsTheme => const TextStyle(
        fontFamily: 'Poppins',
        letterSpacing: 0,
        fontSize: 14,
        height: 0,
      );

  static TextStyle get montserratTheme => const TextStyle(
        fontFamily: 'Montserrat',
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        height: 0,
        color: charcoal,
        fontSize: 14,
      );
}
