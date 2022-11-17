import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0XFF004E98),
      primaryColorDark: const Color(0XFFACACAC),
      primaryColorLight: const Color(0xFFFC6752),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Cairo",
      dividerTheme: const DividerThemeData(thickness: 0.5, color: Colors.grey),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 24)),
      primarySwatch: Colors.blue,
      canvasColor: const Color(0XFF877EF2),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline2: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        headline3: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline4: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w600,
            fontSize: 16.0.sp),
        headline5: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF)),
        headline6: TextStyle(
            color: Colors.black, fontSize: 32.sp, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        bodyText2: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF423E46)),
        subtitle1: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black54),
        subtitle2: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 98, 238)),
        overline: TextStyle(
            fontSize: 15.sp,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        caption: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF5E5E5E)),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: Colors.teal,
      primaryColorLight: Colors.amber,
      primaryColorDark: Colors.white70,
      primarySwatch: Colors.blue,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white, size: 24)),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), //heading screens text
        headline2: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w900), // User Name text
        headline3: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400), // Gifts text
        headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0.sp),
        headline5: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF)), // Button text
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold), //play video & skip Text
        subtitle1: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white), //screens Details terms text
        subtitle2: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 98, 238)),
        bodyText1: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 206, 211, 213),
            fontWeight: FontWeight.w600), //wanna know Text
        bodyText2: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), // play video subtitle
        caption: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 244, 241, 241)),
        overline: TextStyle(
            fontSize: 15.sp,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Colors.amber), //like intrests text
      ),
      scaffoldBackgroundColor: const Color.fromARGB(209, 17, 9, 35),
      fontFamily: "Cairo",
      dividerTheme: const DividerThemeData(thickness: 0.5, color: Colors.amber),
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}
