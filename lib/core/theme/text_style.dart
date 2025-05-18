import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';

class AppTextStyle extends TextTheme {
  static TextTheme get light => TextTheme(
    displayLarge: _style(36, FontWeight.w800, ColorsManager.blackPrimary),
    displayMedium: _style(26, FontWeight.w400, ColorsManager.blackPrimary),
    headlineLarge: _style(22, FontWeight.w800, ColorsManager.blackPrimary),
    headlineMedium: _style(18, FontWeight.w800, ColorsManager.blackPrimary),
    titleLarge: _style(18, FontWeight.w800, ColorsManager.blackPrimary),
    titleMedium: _style(16, FontWeight.w800, ColorsManager.blackPrimary),
    bodyLarge: _style(16, FontWeight.w400, ColorsManager.blackPrimary),
    bodyMedium: _style(14, FontWeight.w400, ColorsManager.blackPrimary),
    titleSmall: _style(14, FontWeight.w800, ColorsManager.blackPrimary),
    bodySmall: _style(12, FontWeight.w200, ColorsManager.blackPrimary),
    labelLarge: _style(12, FontWeight.w800, ColorsManager.blackPrimary),
    labelMedium: _style(10, FontWeight.w400, ColorsManager.blackPrimary),
    labelSmall: _style(8, FontWeight.w400, ColorsManager.blackPrimary),
  );

  static TextTheme get dark => TextTheme(
    displayLarge: _style(36, FontWeight.w800, ColorsManager.white),
    displayMedium: _style(26, FontWeight.w400, ColorsManager.white),
    headlineLarge: _style(22, FontWeight.w800, ColorsManager.white),
    headlineMedium: _style(18, FontWeight.w800, ColorsManager.white),
    titleLarge: _style(18, FontWeight.w800, ColorsManager.white),
    titleMedium: _style(16, FontWeight.w800, ColorsManager.white),
    bodyLarge: _style(16, FontWeight.w400, ColorsManager.white),
    bodyMedium: _style(14, FontWeight.w400, ColorsManager.white),
    titleSmall: _style(14, FontWeight.w800, ColorsManager.white),
    bodySmall: _style(12, FontWeight.w200, ColorsManager.white),
    labelLarge: _style(12, FontWeight.w800, ColorsManager.white),
    labelMedium: _style(10, FontWeight.w400, ColorsManager.white),
    labelSmall: _style(8, FontWeight.w400, ColorsManager.white),
  );

  static TextStyle _style(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontSize: size.sp,
      fontFamily: "telegraf",
      fontWeight: weight,
      color: color,
    );
  }
}
