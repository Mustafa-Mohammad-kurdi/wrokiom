import 'package:flutter/material.dart';

class AppColors {
  static const Color instgram = Color(0xffC13584);
  static const Color google = Color(0xff4285F4);
  static const Color facebook = Color(0xff4267B2);

  static const Color white1 = Color(0xfff7f7f7);
  static const Color whiteLight = Color(0xFFEAEAEA);
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Map<int, Color> primarySwatch = {
    50: Color(0xFFEAF0FE),
    100: Color(0xFFCADBFD),
    200: Color(0xFFA7C3FB),
    300: Color(0xFF83AAF9),
    400: Color(0xFF6998F8),
    500: Color(0xFF4E86F7),
    600: Color(0xFF477EF6),
    700: Color(0xFF3D73F5),
    800: Color(0xFF3569F3),
    900: Color(0xFF2556F1),
  };
  static const MaterialColor primary = MaterialColor(0xFF4E86F7, primarySwatch);

  static const Map<int, Color> greySwatch = {
    0: Color(0xFFF2F2F3),
    10: Color(0xFFE8E8E9),
    20: Color(0xFFD0D1D3),
    30: Color(0xFFB9BABD),
    40: Color(0xFFA1A3A7),
    50: Color(0xFFA1A3A7),
    60: Color(0xFF73757A),
    70: Color(0xFF5B5E64),
    80: Color(0xFF44474E),
    90: Color(0xFF2C3038),
    100: Color(0xFF151922),
  };

  static const MaterialColor grey = MaterialColor(0xFF73757A, greySwatch);

  static const Map<int, Color> secondaryMaterial = {
    50: Color(0xFFEAF0FE),
    100: Color(0xFFCADBFD),
    200: Color(0xFFA7C3FB),
    300: Color(0xFF83AAF9),
    400: Color(0xFF6998F8),
    500: Color(0xFF4E86F7),
    600: Color(0xFF477EF6),
    700: Color(0xFF3D73F5),
    800: Color(0xFF3569F3),
    900: Color(0xFF2556F1),
  };

  static const MaterialColor secondary =
      MaterialColor(0xFF0088CC, secondaryMaterial);

  static const Color transparent = Color(0x00000000);

  static const Color red = Color(0xFFE54B4B);
  static const Color yellow = Color(0xFFE6B900);
  static const Color green = Color(0xFF10B894);

  static const Color redLight = Color(0xFFFFDCDC);
  static const Color yellowLight = Color(0xFFFFF3C3);
  static const Color greenLight = Color(0xFFD0FFF5);

  //Text Theme
  static const Color lightText = Color(0xFF979797);
  static const Color darkText = Color(0xFF555555);
  static const Color darkerText = Color(0xFFB5B5B5);
  static const Color blackText = Color(0xFF0E0F12);
}
