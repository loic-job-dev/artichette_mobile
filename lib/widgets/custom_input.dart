// lib/widgets/custom_input.dart
import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_spacing.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, size: 20, color: AppColors.textSecondary)
                : null,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
