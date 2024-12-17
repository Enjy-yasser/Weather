import 'package:flutter/material.dart';

import 'colors_app.dart';

class MyThemes {
  // Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.skyBlue,
    secondaryHeaderColor: AppColors.oceanBlue,
    primaryColorLight: AppColors.cloudWhite,
    splashColor: AppColors.dawnPink,
    scaffoldBackgroundColor: AppColors.skyBlue,
    indicatorColor: AppColors.oceanBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.sunnyYellow,
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
    primaryColor: AppColors.nightBlue,
    secondaryHeaderColor: AppColors.twilightPurple,
    primaryColorLight: AppColors.lightningYellow,
    splashColor: AppColors.twilightPurple,
    scaffoldBackgroundColor: AppColors.stormyGrey,
    indicatorColor: AppColors.lightningYellow,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.nightBlue,
      iconTheme: IconThemeData(color: AppColors.frostWhite),
      titleTextStyle: TextStyle(color: AppColors.frostWhite, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.frostWhite, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.twilightPurple, fontSize: 16),
    ),
  );
}
