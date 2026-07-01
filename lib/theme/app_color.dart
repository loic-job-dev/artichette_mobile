import 'package:flutter/material.dart';

abstract final class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF2D494C);
  static const Color secondary = Color(0xFF8BA89A);
  static const Color accent = Color(0xFFE0C64D);

  // Background
  static const Color background = Color(0xFFF9FAF8);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F4F2);

  // Borders
  static const Color outline = Color(0xFFC7CFCA);

  // Text
  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF5E6662);
  static const Color textLight = Colors.white;

  // Feedback
  static const Color success = Color(0xFF5D8A66);
  static const Color warning = accent;
  static const Color error = Color(0xFFC84D4D);

  // Shadows
  static const Color shadow = Color(0x14000000);

  /// Material ColorScheme
  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,

    primary: primary,
    onPrimary: Colors.white,

    secondary: secondary,
    onSecondary: Colors.white,

    tertiary: accent,
    onTertiary: Colors.black,

    error: error,
    onError: Colors.white,

    surface: surface,
    onSurface: textPrimary,

    outline: outline,

    surfaceContainerHighest: surfaceVariant,
  );
}