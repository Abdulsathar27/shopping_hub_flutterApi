import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  /// Title for AppBars and major headers
  static final TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  /// Product title in product cards and detail screen
  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  /// Subtitle for card descriptions and labels
  static final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMedium,
  );

  /// Price text style
  static final TextStyle price = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
  );

  /// Body text for general readable content
  static final TextStyle body = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  /// Small helper text for secondary information
  static final TextStyle small = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  );
}
