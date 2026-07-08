import 'package:flutter/material.dart';

class FeatureChip extends StatelessWidget {
  final String label;
  final IconData? icon; 
  final double iconSize; 

  const FeatureChip({
    super.key,
    required this.label,
    this.icon, 
    this.iconSize = 16, 
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize,
            ),
            const SizedBox(width: 6), 
          ],
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}