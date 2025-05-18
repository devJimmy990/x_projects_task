import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/core/theme/text_style.dart';

class AppThemeData {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsManager.blackSecondary,
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: const ColorScheme.light(
      primary: ColorsManager.blackSecondary,
      onSecondary: ColorsManager.black,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: ColorsManager.white,
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: AppTextStyle.light,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: ColorsManager.blackSecondary,
        foregroundColor: Colors.white,
      ),
    ),
    radioTheme: RadioThemeData(
      overlayColor: WidgetStateProperty.all(ColorsManager.blackPrimary),
      fillColor: WidgetStateProperty.all(ColorsManager.blackPrimary),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsManager.blackSecondary,
    scaffoldBackgroundColor: ColorsManager.blackPrimary,
    colorScheme: const ColorScheme.dark(
      primary: ColorsManager.blackSecondary,
      onSecondary: ColorsManager.black,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.blackSecondary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: AppTextStyle.dark,

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: ColorsManager.blackSecondary,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(ColorsManager.white),
    ),
    cardTheme: const CardTheme(color: ColorsManager.greyDark),
  );
}
