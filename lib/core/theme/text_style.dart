import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/constants/colors_manager.dart';

class AppTextStyle extends TextTheme {
  static TextTheme get light => TextTheme(
    // Large Titles (36px - 900)
    displayLarge: TextStyle(
      fontSize: 36.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    // Main Headlines (26px - 400)
    displayMedium: TextStyle(
      fontSize: 26.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.blackPrimary,
    ),

    // Section Headers (22px - 800)
    headlineLarge: TextStyle(
      fontSize: 22.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    // Titles or Buttons (18px - 900/800)
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    titleLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    // Content Headings (16px - 900 / 400)
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.blackPrimary,
    ),

    // Regular body text (14px - 400, 900)
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.blackPrimary,
    ),

    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    // Smaller content (12px - 900, 400)
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w200,
      color: ColorsManager.blackPrimary,
    ),

    labelLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.blackPrimary,
    ),

    // Tiny text (10px and 8px — fallback to 400)
    labelMedium: TextStyle(
      fontSize: 10.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.blackPrimary,
    ),

    labelSmall: TextStyle(
      fontSize: 8.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.blackPrimary,
    ),
  );

  static TextTheme get dark => TextTheme(
    // Large Titles (36px - 900)
    displayLarge: TextStyle(
      fontSize: 36.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    // Main Headlines (26px - 400)
    displayMedium: TextStyle(
      fontSize: 26.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.white,
    ),

    // Section Headers (22px - 800)
    headlineLarge: TextStyle(
      fontSize: 22.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    // Titles or Buttons (18px - 900/800)
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    titleLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    // Content Headings (16px - 900 / 400)
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.white,
    ),

    // Regular body text (14px - 400, 900)
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.white,
    ),

    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    // Smaller content (12px - 900, 400)
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w200,
      color: ColorsManager.white,
    ),

    labelLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w800,
      color: ColorsManager.white,
    ),

    // Tiny text (10px and 8px — fallback to 400)
    labelMedium: TextStyle(
      fontSize: 10.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.white,
    ),

    labelSmall: TextStyle(
      fontSize: 8.sp,
      fontFamily: "telegraf",
      fontWeight: FontWeight.w400,
      color: ColorsManager.white,
    ),
  );
}
