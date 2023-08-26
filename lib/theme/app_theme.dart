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
            TextStyle(fontSize: 15.r, fontFamily: 'Poppins'),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
          ),
          elevation: MaterialStateProperty.all(6.w),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 24.r,
              fontFamily: 'LilitaOne',
              color: Colors.indigo.shade700,
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: majorelleBlue),
      scaffoldBackgroundColor: ghostWhite,
    );

//amber - 0xffF2AF29
