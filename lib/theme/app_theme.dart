import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

ThemeData get appTheme => ThemeData(
      primarySwatch: Colors.indigo,
      canvasColor: majorelleBlue,
      //listTileTheme: ListTileThemeData(),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 18.r),
        bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 15.r),
        displayLarge: TextStyle(fontFamily: 'LilitaOne', fontSize: 21.r),
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
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 16.r,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
              color: spaceCadet,
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: majorelleBlue),
      scaffoldBackgroundColor: ghostWhite,
    );

//amber - 0xffF2AF29
