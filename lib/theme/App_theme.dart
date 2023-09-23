import 'package:contact_diary_app/colors/App_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static bool isDark = false;

  static ThemeData LightTheme = ThemeData(
    textTheme: const TextTheme(headline5: TextStyle(color: Colors.orange)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColorlight,
      primary: AppColors.primaryColorlight,
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColorDark,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.secondaryColorDark,
      secondary: AppColors.secondaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
