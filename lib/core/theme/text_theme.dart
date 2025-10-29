import 'package:apiprojectecom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';


class AppTextTheme {
  static TextTheme get textTheme {
    return TextTheme(
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      titleMedium: AppTextStyles.subtitle,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.subtitle,
      bodySmall: AppTextStyles.small,
    );
  }
}
