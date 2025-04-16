import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/core/constants/app_color.dart';

class ThemeConfig {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    fontFamily: 'Bilo',
    textTheme: const TextTheme(

      bodySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      foregroundColor: AppColors.kWhite,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    
  );
}
