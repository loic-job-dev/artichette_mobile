import 'package:flutter/material.dart';

import '../theme/app_button_theme.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
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
    return OutlinedButton(
      style: compact
          ? AppButtonTheme.compactOutlinedTheme
          : AppButtonTheme.defaultOutlinedTheme,
      onPressed: onPressed,
      child: child,
    );
  }
}