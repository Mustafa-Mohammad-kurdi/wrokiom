import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    cardTheme: cardTheme,
    scaffoldBackgroundColor: Colors.white,
    highlightColor: AppColors.secondary[50],
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary[900],
    primaryColorLight: AppColors.primary[400],
    canvasColor: Colors.white,
    unselectedWidgetColor: Colors.grey,

    textTheme: textTheme,
    appBarTheme: appBarTheme,
    primaryTextTheme: textTheme,
    iconTheme: IconThemeData(color: AppColors.primary, size: 6.0.r),
    primaryIconTheme: IconThemeData(color: AppColors.white, size: 5.0.r),
    elevatedButtonTheme: elevatedButtonThemeData(),
    textButtonTheme: textButtonThemeData(),
    outlinedButtonTheme: outlinedButtonTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primary)
        .copyWith(secondary: AppColors.secondary),
  );

  static Color scaffoldBackgroundColor = AppColors.white;

  static CardTheme cardTheme = CardTheme(
    margin: EdgeInsets.only(bottom: AppStyles.contentVerticalPaddingValue),
    color: AppColors.primary,
    elevation: 1,
    shadowColor: AppColors.primary,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
        borderRadius: AppStyles.cardRadius),
  );

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    textStyle: button,
    padding: EdgeInsets.all(15),
    side: BorderSide(color: AppColors.primary, style: BorderStyle.solid),
  ));

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(7)),
            foregroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary[200]!),
            textStyle: MaterialStateProperty.all<TextStyle>(subtitle2),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: AppColors.primary[50]!)))));
  }

  static ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary),
            textStyle: MaterialStateProperty.all<TextStyle>(button),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.all<double>(5),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ))));
  }

  static AppBarTheme appBarTheme = AppBarTheme(
      color: AppColors.white,
      titleTextStyle: headline3.copyWith(fontWeight: FontWeight.bold),
      elevation: .5,
      iconTheme: IconThemeData(color: AppColors.blackText)
      //    brightness: Brightness.light,

      );

  static TextTheme textTheme = TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText2: bodyText2,
    bodyText1: bodyText1,
    button: button,
    caption: caption,
    overline: overLine,
  );
  static const String fontCairo = 'Rubik';

  static const String font = fontCairo;

  static TextStyle headline1 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    wordSpacing: 1,
    letterSpacing: 0.4,
    color: AppColors.blackText,
  );

  static TextStyle headline2 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    letterSpacing: 0.4,
    // height: 1.5,
    color: AppColors.blackText,
  );
  static TextStyle headline3 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    letterSpacing: 0.4,
    // height: 1.5,
    color: AppColors.blackText,
  );

  static TextStyle headline4 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    letterSpacing: 0.4,
    color: AppColors.blackText,
  );

  static TextStyle headline5 = TextStyle(
    fontFamily: font,
    //   fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.darkText
  );

  //appbar title
  static TextStyle headline6 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: AppColors.blackText,
  );

  static TextStyle subtitle1 = const TextStyle(
    fontFamily: AppTheme.font,
    height: 2,
    fontSize: 12,
    //letterSpacing: -0.04,
    color: AppColors.grey,
  );

  static TextStyle subtitle2 = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: -0.04,
    color: AppColors.blackText,
  );

  //default Text
  static TextStyle bodyText2 = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w600,
    fontSize: 10,
//    letterSpacing: 0.2,
    color: AppColors.blackText,
  );

  static TextStyle bodyText1 = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    // letterSpacing: -0.05,
    color: AppColors.blackText,
  );

  //Validator Error message
  static TextStyle caption = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    letterSpacing: 0.2,
    color: AppColors.lightText, // was lightText
  );

  static TextStyle overLine = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.bold,
    fontSize: 6.0,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.blackText.withOpacity(0.5),
  );

  static TextStyle button = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.white,
  );
}
