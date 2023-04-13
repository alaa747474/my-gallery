import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
     // disabledColor: const Color.fromARGB(255, 70, 70, 70),
      hintColor: const Color.fromARGB(255, 169, 169, 169),
      primaryColor:const Color(0xffDDCDFF),
      secondaryHeaderColor:const Color(0xffF49D9D),
      cardColor: Colors.white,
     // scaffoldBackgroundColor: const Color.fromARGB(255, 224, 239, 255),
      shadowColor: Colors.black,
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      labelLarge: TextStyle(
        color: const Color(0xff4A4A4A),
        fontWeight: FontWeight.bold,
        fontSize: 35.sp,
      ),
      labelMedium: TextStyle(
        color: const Color(0xff4A4A4A),
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),

      titleLarge: TextStyle(
        color: const Color(0xff4A4A4A),
        fontWeight: FontWeight.normal,
        fontSize: 18.sp,
      ),
      bodyLarge: TextStyle(
        color: const Color(0xff4A4A4A),
        fontSize: 16.sp,
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        color: const Color(0xff4A4A4A),
        fontSize: 14.sp,
      ),
    );
  }
}