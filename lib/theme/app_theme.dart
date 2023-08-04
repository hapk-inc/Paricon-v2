import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get appTheme => ThemeData(
      primarySwatch: Colors.indigo,
      canvasColor: const Color(0xff724cf9),
      //listTileTheme: ListTileThemeData(),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 24),
        bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 20),
        displayLarge: TextStyle(fontFamily: 'LilitaOne', fontSize: 32),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xff333232)),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 12.sp, fontFamily: 'Poppins'),
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
              fontSize: 24,
              fontFamily: 'LilitaOne',
              color: Colors.indigo.shade700,
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff724cf9)),
      scaffoldBackgroundColor: const Color(0xfffbf9ff),
      listTileTheme: const ListTileThemeData(),
    );

//amber - 0xffF2AF29
