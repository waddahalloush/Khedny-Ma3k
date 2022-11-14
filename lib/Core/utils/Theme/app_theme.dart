import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0XFF004E98),
      primaryColorDark: const Color(0XFFACACAC),
      primaryColorLight: const Color(0xFFFC6752),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black, size: 24)),
      primarySwatch: Colors.blue,
      canvasColor: const Color(0XFF877EF2),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline2: TextStyle(
            fontSize: 20.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        headline3: TextStyle(
            fontSize: 15.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline5: TextStyle(
            fontSize: 20.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF)),
        bodyText1: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        bodyText2: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: const Color(0xFF423E46)),
        subtitle1: TextStyle(
            fontSize: 15.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            color: Colors.black54),
        subtitle2: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            color: const Color.fromARGB(255, 59, 98, 238)),
        overline: TextStyle(
            fontSize: 15.sp,
            overflow: TextOverflow.ellipsis,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            color: Colors.black),
        caption: TextStyle(
            fontSize: 15.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.normal,
            color: const Color(0xFF5E5E5E)),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: Colors.amber,
      primaryColorLight: Colors.deepOrange,
      primaryColorDark: Colors.white70,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Colors.white), //heading screens text
        headline2: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w900), // User Name text
        headline3: TextStyle(
            fontSize: 16,
            color: Color(0xFF33196B),
            fontWeight: FontWeight.w400), // Gifts text
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ), //login with email & Button text
        headline5: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold), // Button text
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900), //play video & skip Text
        subtitle1: TextStyle(
            fontSize: 12, color: Colors.white), //screens Details terms text
        subtitle2:
            TextStyle(fontSize: 11, color: Colors.redAccent), // terms subtitle
        bodyText1: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 206, 211, 213),
            fontWeight: FontWeight.w600), //wanna know Text
        bodyText2: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold), // play video subtitle
        caption: TextStyle(
          fontSize: 10,
          color: Color.fromARGB(196, 250, 247, 247),
        ), //create account text
        overline: TextStyle(
            color: Colors.amber,
            fontSize: 10,
            fontWeight: FontWeight.bold), //like intrests text
      ),
      scaffoldBackgroundColor: const Color.fromARGB(209, 17, 9, 35),
      fontFamily: 'Cairo',
      dividerColor: Colors.amber,
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}
