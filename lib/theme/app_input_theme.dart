import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_radius.dart';

abstract final class AppInputTheme {
  AppInputTheme._();

  static final theme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    isDense: true,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),

    hintStyle: const TextStyle(
      color: AppColors.textSecondary,
    ),

    errorMaxLines: 2,

    border: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.outline,
      ),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.outline,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.accent,
        width: 2,
      ),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.outline,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.error,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 2,
      ),
    ),
  );
}