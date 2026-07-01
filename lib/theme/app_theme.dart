import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import 'app_card_theme.dart';
import 'app_color.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      colorScheme: AppColors.lightScheme,

      scaffoldBackgroundColor: AppColors.background,

      textTheme: AppTextTheme.textTheme,

      filledButtonTheme: AppButtonTheme.defaultFilledButtonThemeData,
      outlinedButtonTheme: AppButtonTheme.defaultOutlinedButtonThemeData,
      textButtonTheme: AppButtonTheme.text,
      iconButtonTheme: AppButtonTheme.icon,

      inputDecorationTheme: AppInputTheme.theme,

      cardTheme: AppCardTheme.theme,
    );
  }
}