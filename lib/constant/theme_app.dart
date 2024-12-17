import 'package:flutter/material.dart';

import 'colors_app.dart';

class MyThemes {
  // Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.whiteColor,
    secondaryHeaderColor: AppColors.blackColor,
    primaryColorLight: AppColors.whiteColor,
    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    indicatorColor: AppColors.oceanBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.oceanBlue,
      iconTheme: IconThemeData(color: AppColors.cloudWhite),
      titleTextStyle: TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkBlue, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.oceanBlue, fontSize: 16),
    ),
  );

  // Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blackColor,
    secondaryHeaderColor: AppColors.whiteColor,
    primaryColorLight: AppColors.blackColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.stormyGrey,
    indicatorColor: AppColors.darkBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.stormyGrey,
      iconTheme: IconThemeData(color: AppColors.frostWhite),
      titleTextStyle: TextStyle(color: AppColors.frostWhite, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.frostWhite, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.frostWhite, fontSize: 16),
    ),
  );
}
