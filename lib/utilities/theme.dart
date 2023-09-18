import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff981A1E),
    ),
    //scaffoldBackgroundColor: Color(0xfff9f2d5),
    fontFamily: 'Cairo',
    textTheme: TextTheme(
      titleSmall: TextStyle(
        //fontWeight: FontWeight.bold,
        color: Colors.black, fontSize: 13.sp,
      ),
      titleMedium: TextStyle(
          color: const Color(0xff283255),
          fontSize: 15.sp,
          fontWeight: FontWeight.bold),
     
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      ),
      labelMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25.sp,
          shadows: const [
            Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1))
          ]),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff981A1E),
      secondary: Color(0xff283255),
      background: Color(0xff69A0C7),
      brightness: Brightness.light,
      primaryContainer: Color(0xff174459),
      secondaryContainer: Color(0xfff9f2d5),
    ),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color(0xfff9f2d5),
      secondary: Color(0xffd6bf97),
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
