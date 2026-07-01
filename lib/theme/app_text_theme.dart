import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

abstract final class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),

      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),

      headlineLarge: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),

      headlineMedium: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),

      titleLarge: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),

      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: AppColors.textPrimary,
      ),

      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: AppColors.textSecondary,
      ),

      labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}