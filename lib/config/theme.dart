import 'package:demoapp/config/palette.dart';
import 'package:demoapp/helpers/helpers.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Inter',
  primarySwatch: generateMaterialColor(Palette.primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  indicatorColor: Palette.primary,
  textTheme: TextTheme().copyWith(
    button: TextStyle(
      fontSize: 16.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    ),
    headline2: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 60.0,
    ),
    headline3: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 48.0,
    ),
    headline4: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 32.0,
    ),
    headline5: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),
    headline6: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
    ),
    bodyText1: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
    ),
    bodyText2: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
    ),
    subtitle1: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    subtitle2: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    caption: TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
  ),
);
