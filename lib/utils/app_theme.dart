import 'package:flutter/material.dart';

/// Register Application Theme
///
/// Light theme | Dark theme
class AppTheme {
  // it will return light theme with all
  // app component in dark color
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: LightAppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightAppColors.primaryColor,
        titleTextStyle: TextStyle(
          color: LightAppColors.textColor,
        ),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: LightAppColors.textColor,
        ),
      ),
    );
  }

  // it will return dark theme with all
  // app component in dark color
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: DarkAppColor.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkAppColor.primaryColor,
        titleTextStyle: TextStyle(
          color: DarkAppColor.textColor,
        ),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: DarkAppColor.textColor,
        ),
      ),
    );
  }
}

/// Colors for light theme for [AppTheme.lightTheme]
abstract class LightAppColors {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF000000);
}

/// Colors for dark theme for [AppTheme.darkTheme]
abstract class DarkAppColor {
  static const Color primaryColor = Color(0xFF000000);
  static const Color textColor = Color(0xFFFFFFFF);
}
