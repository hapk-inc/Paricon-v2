import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';
import '../values/colors.dart';

class SlidingPanelTheme {
  double slidingPanelHeight = 240.h;

  EdgeInsets slidingPanelPadding = EdgeInsets.all(15.r);

  BorderRadius slidingPanelRadius =
      BorderRadius.vertical(top: Radius.circular(30.r));

  BorderRadius slidingPanelFullRadius = BorderRadius.circular(15.r);

  Color slidingPanelColor = ghostWhite;

  Color backDrop = richBlack;
}

class MyTheme {
  final ScreenSize screenSize;

  MyTheme(this.screenSize);

  ThemeData get themeData {
    final SizeNotifier sizeNotifier = SizeNotifier(screenSize);
    final bool isP = sizeNotifier.isP;

    final double appBarHeight = isP ? 105.h : 120.h;

    return ThemeData(
      primaryColor: majorelleBlue,
      secondaryHeaderColor: Colors.pink,
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        color: ghostWhite,
        shadowColor: frenchGray,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 7.5.r,
      ),
      listTileTheme: const ListTileThemeData(
        dense: true,
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        minLeadingWidth: 0,
      ),
      canvasColor: mistyRose,
      cardColor: ghostWhite,
      snackBarTheme: const SnackBarThemeData(),
      hintColor: gray,
      dividerColor: frenchGray,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: ghostWhite,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: majorelleBlue,
        iconTheme: IconThemeData(size: isP ? 18.r : 21.r),
        titleTextStyle: montserratTheme.copyWith(
          color: ghostWhite,
          fontSize: 21.r,
        ),

        //shape: RoundedRectangleBorder(borderRadius: bottomRadius),
        toolbarHeight: appBarHeight,
        elevation: 3.r,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          foregroundColor: const MaterialStatePropertyAll(ghostWhite),
          textStyle: MaterialStatePropertyAll(
            montserratTheme.copyWith(
              color: ghostWhite,
              fontSize: isP ? 15.r : 18.r,
            ),
          ),
          elevation: MaterialStatePropertyAll(1.5.r),
          backgroundColor: const MaterialStatePropertyAll(violetBlue),
          minimumSize: MaterialStatePropertyAll(Size.fromHeight(isP ? 48 : 39)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5.r),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
              montserratTheme.copyWith(fontSize: isP ? 13.5.r : 15.r)),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          minimumSize: MaterialStatePropertyAll(Size(360.w, 60.h)),
          backgroundColor: const MaterialStatePropertyAll(majorelleBlue),
          textStyle: MaterialStatePropertyAll(
            montserratTheme.copyWith(
              fontSize: 18.r,
              letterSpacing: 0,
              height: 0,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: wendyTheme.copyWith(
          fontSize: isP ? 33.r : 36.r,
          height: 1.5,
        ),
        titleMedium: wendyTheme.copyWith(
          fontSize: isP ? 30.r : 33.r,
          height: 1.2,
        ),
        titleSmall: wendyTheme.copyWith(
          fontSize: isP ? 24.r : 27.r,
          height: 0.9,
          color: gray,
        ),

        //bodyFonts
        bodyLarge: questrialTheme.copyWith(
          height: 1.8,
          fontSize: 24.r,
        ),
        bodyMedium: questrialTheme.copyWith(
          height: 1.8,
          fontSize: SizeNotifier(screenSize).isP ? 15.r : 18.r,
        ),
        bodySmall: questrialTheme.copyWith(
            fontSize: SizeNotifier(screenSize).isP ? 12.r : 13.5.r),

        //headlineFonts
        headlineLarge: montserratTheme.copyWith(fontSize: 15.r),
        headlineMedium:
            montserratTheme.copyWith(fontSize: isP ? 12.30.r : 13.2.r),
        headlineSmall: montserratTheme.copyWith(fontSize: 12.r),

        //label
        labelLarge: questrialTheme.copyWith(color: charcoal
            //  fontSize: 15.r,
            // fontWeight: FontWeight.w300,
            ),

        displayMedium: questrialTheme.copyWith(
          fontSize: isP ? 18.r : 21.r,
          //fontWeight: FontWeight.w300,
          height: 1.2,
        ),

        displayLarge: montserratTheme.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: isP ? 18.r : 21.r,
          color: cornellRed,
          letterSpacing: 0.075.r,
        ),
      ),
    );
  }

  static TextStyle get wendyTheme => const TextStyle(
        fontFamily: 'WendyOne',
        letterSpacing: 0,
        height: 0,
        color: charcoal,
        fontSize: 24,
      );

  static TextStyle get questrialTheme => const TextStyle(
        fontFamily: 'Questrial',
        letterSpacing: 0,
        height: 0,
        fontSize: 13.5,
        color: gray,
      );

  static TextStyle get poppinsTheme => const TextStyle(
        fontFamily: 'Poppins',
        letterSpacing: 0,
        fontSize: 15,
      );

  static TextStyle get montserratTheme => const TextStyle(
        fontFamily: 'Montserrat',
        letterSpacing: 0,
        height: 0,
      );
}

/*dataTableTheme: DataTableThemeData(
        horizontalMargin: 12.w,
        dividerThickness: 0.6.r,
        columnSpacing: 3.w,
        headingRowHeight: 48.h,
        dataRowMinHeight: 48.h,
      ),*/
