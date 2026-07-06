import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_radius.dart';

abstract final class AppButtonTheme {
  AppButtonTheme._();

  static const _height = 52.0;
  static const _heightCompact = 40.0;

  static ButtonStyle createFilledStyle({
    double height = _height,
  }) {
    return FilledButton.styleFrom(
      minimumSize: Size(0, height),
      elevation: 0,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.accent,
      disabledBackgroundColor: AppColors.outline,
      disabledForegroundColor: Colors.white70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
      ),
    ).copyWith(
      overlayColor: WidgetStatePropertyAll(
        AppColors.surface.withValues(alpha: 0.08),
      ),
    );
  }

  // Default themeData
  static final defaultFilledButtonThemeData = FilledButtonThemeData(
    style: createFilledStyle(),
  );

  //Default theme
  static final defaultFilledTheme = createFilledStyle(
    height: _height,
  );
  // Compact theme
  static final compactFilledTheme = createFilledStyle(
    height: _heightCompact,
  );


  static ButtonStyle createOutlinedStyle({
      double height = _height,
  }) {
    return OutlinedButton.styleFrom(
      minimumSize: Size(0, height),
      elevation: 0,
      foregroundColor: AppColors.primary,
      side: const BorderSide(
        color: AppColors.primary,
        width: 1.3,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
      ),
    ).copyWith(
      overlayColor: WidgetStatePropertyAll(
        AppColors.primary.withValues(alpha: 0.08),
      ),
    );
  }

  // Default themeData
  static final defaultOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: createOutlinedStyle(),
  );

  //Default theme
  static final defaultOutlinedTheme = createOutlinedStyle(
    height: _height,
  );
  // Compact theme
  static final compactOutlinedTheme = createOutlinedStyle(
    height: _heightCompact,
  );

  static final text = TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size.fromHeight(_height),
      foregroundColor: AppColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
      ),
    ),
  );

  static final icon = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.primary,
      iconSize: 22,
    ),
  );
}