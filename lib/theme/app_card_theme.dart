import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_radius.dart';

abstract final class AppCardTheme {
  AppCardTheme._();

  static final theme = CardThemeData(
    elevation: 1,
    color: AppColors.surfaceVariant,
    shadowColor: AppColors.accent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.large,
      side: const BorderSide(
        color: AppColors.outline,
      ),
    ),
  );
}