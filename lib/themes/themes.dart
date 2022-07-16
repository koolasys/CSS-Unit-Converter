import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(187, 90, 90, .1),
  100: const Color.fromRGBO(187, 90, 90, .2),
  200: const Color.fromRGBO(187, 90, 90, .3),
  300: const Color.fromRGBO(187, 90, 90, .4),
  400: const Color.fromRGBO(187, 90, 90, .5),
  500: const Color.fromRGBO(187, 90, 90, .6),
  600: const Color.fromRGBO(187, 90, 90, .7),
  700: const Color.fromRGBO(187, 90, 90, .8),
  800: const Color.fromRGBO(187, 90, 90, .9),
  900: const Color.fromRGBO(187, 90, 90, 1),
};

MaterialColor themeColor = MaterialColor(0xFFbb5a5a, color);
MaterialColor scaffoldBG = MaterialColor(0xffF9F1F1, color);

//final MaterialColor themeColor = Color(0xffbb5a5a);
ThemeData defaultTheme = ThemeData(
  scaffoldBackgroundColor: scaffoldBG,
  primarySwatch: themeColor,
  fontFamily: "Chilanka",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black87),
    headline4: TextStyle(
      fontSize: 40,
    ),
    headline5: TextStyle(fontSize: 40),
  ),
);
