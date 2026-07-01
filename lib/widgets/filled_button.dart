import 'package:flutter/material.dart';

import '../theme/app_button_theme.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.compact = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: compact
          ? AppButtonTheme.compactFilledTheme
          : AppButtonTheme.defaultFilledTheme, // global theme
      onPressed: onPressed,
      child: child,
    );
  }
}