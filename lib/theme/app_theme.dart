import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get appTheme => ThemeData(
      primarySwatch: Colors.indigo,
      //listTileTheme: ListTileThemeData(),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Poppins', fontSize: 24.sp),
        bodyText2: TextStyle(fontFamily: 'Poppins', fontSize: 20.sp),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              color: Colors.indigo.shade700,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(4.sp),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              color: Colors.indigo.shade700,
            ),
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.deepPurple.shade50,
      listTileTheme: const ListTileThemeData(),
    );
