import 'package:flutter/material.dart';

class AppColors {
  static var primary = const Color.fromRGBO(255, 255, 255, 1);

  static var textPrimary = const Color.fromRGBO(0, 0, 0, 1);
  static var textSecondary = const Color.fromRGBO(123, 123, 123, 1);

  static var borderBox = const Color.fromRGBO(229, 229, 229, 1);

  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
  static const int _mcgpalette0PrimaryValue = 0xFFFFFFFF;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _mcgpalette0AccentValue = 0xFFFFFFFF;
}
