import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
import 'my_color.dart';

ThemeData appTheme(ScreenSize sSize) => ThemeData(
      primarySwatch: Colors.indigo,
      canvasColor: majorelleBlue,
      //listTileTheme: ListTileThemeData(),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 18.r),
        bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16.r,
          color: raisinBlack,
          fontWeight: FontWeight.w700,
        ),
        displayLarge: TextStyle(fontFamily: 'LilitaOne', fontSize: 21.r),
        titleLarge: const TextStyle(fontFamily: 'LilitaOne'),
        titleMedium: TextStyle(
          fontSize: 24.r,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          height: 2.1,
          color: jasmine,
        ),
        // titleLarge: TextStyle(fontSize: 30.r),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xff333232)),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14.r, fontFamily: 'Poppins'),
          ),
          fixedSize: MaterialStatePropertyAll(Size(126.w, 42.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          ),
          elevation: MaterialStateProperty.all(6),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(36.h)),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 24.r),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.r),
              //side: BorderSide(color: lavenderBush),
            ),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(color: jasmine, width: 0.45.r),
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 12.r,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
              color: lavenderBush,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 18.r,
              fontWeight: FontWeight.w700,
              fontFamily: 'Cabin',
              height: 1.5,
              color: lavenderBush,
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: majorelleBlue),
      scaffoldBackgroundColor: ghostWhite,
    );

//amber - 0xffF2AF29
