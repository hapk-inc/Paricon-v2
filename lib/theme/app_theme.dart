import 'package:flutter/material.dart';

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
            const TextStyle(fontSize: 18, fontFamily: 'LilitaOne'),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(4.0)),
          elevation: MaterialStateProperty.all(4),
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
      scaffoldBackgroundColor: const Color(0xfffde8e9),
      listTileTheme: const ListTileThemeData(),
    );

//amber - 0xffF2AF29
