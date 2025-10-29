import 'package:apiprojectecom/core/constants/app_colors.dart';
import 'package:apiprojectecom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Light theme configuration for the application
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    cardColor: AppColors.card,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.subtitle,
      bodySmall: AppTextStyles.small,
    ),

    iconTheme: IconThemeData(
      color: AppColors.textDark,
      size: 24,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: AppTextStyles.body.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textLight),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      labelStyle: AppTextStyles.subtitle,
      hintStyle: AppTextStyles.small,
    ),
  );
}
