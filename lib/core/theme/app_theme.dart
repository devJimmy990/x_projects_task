import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';
import 'package:x_projects_task/core/theme/text_style.dart';

class AppThemeData {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.blackSecondary,
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorsManager.blackSecondary,
      // onPrimary: ColorsManager.white,
      // secondary: ColorsManager.secondary,
      onSecondary: ColorsManager.black,
      // surface: ColorManager.bgLight,
      // onSurface: ColorManager.textPrimaryLight,
      // error: ColorManager.error,
      // onError: ColorManager.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: ColorsManager.white,
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.blackPrimary,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    // tabBarTheme: TabBarTheme(
    //   labelColor: ColorManager.textPrimaryLight,
    //   unselectedLabelColor: ColorManager.grey,
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: ColorManager.lightPrimary, width: 2.0),
    //   ),
    // ),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: ColorManager.actionButton,
    //   foregroundColor: ColorManager.white,
    // ),
    textTheme: AppTextStyle.light,
    // inputDecorationTheme: MyInputFieldTheme.light,
  );

  static final ThemeData dark = ThemeData(
    primaryColor: ColorsManager.blackSecondary,
    scaffoldBackgroundColor: ColorsManager.blackPrimary,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: ColorsManager.blackSecondary,
      // onPrimary: ColorsManager.white,
      // secondary: ColorsManager.secondary,
      onSecondary: ColorsManager.black,
      // surface: ColorManager.bgLight,
      // onSurface: ColorManager.textPrimaryLight,
      // error: ColorManager.error,
      // onError: ColorManager.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: ColorsManager.white,
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.blackPrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    // tabBarTheme: TabBarTheme(
    //   labelColor: ColorManager.textPrimaryLight,
    //   unselectedLabelColor: ColorManager.grey,
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(color: ColorManager.lightPrimary, width: 2.0),
    //   ),
    // ),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: ColorManager.actionButton,
    //   foregroundColor: ColorManager.white,
    // ),
    textTheme: AppTextStyle.dark,
    // inputDecorationTheme: MyInputFieldTheme.dark,
  );
}
