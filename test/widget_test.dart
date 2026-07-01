import 'package:artichette/theme/app_color.dart';
import 'package:artichette/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Theme uses the right colors', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(),
      ),
    );

    final BuildContext context = tester.element(find.byType(Scaffold));

    final theme = Theme.of(context);

    expect(theme.colorScheme.primary, AppColors.primary);
    expect(theme.scaffoldBackgroundColor, AppColors.background);
  });

  testWidgets('Text uses the TextTheme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Builder(
          builder: (context) {
            return Text(
              'Bienvenue',
              style: Theme.of(context).textTheme.displayMedium,
            );
          },
        ),
      ),
    );

    final text = tester.widget<Text>(
      find.text('Bienvenue'),
    );

    expect(text.style?.fontSize, 30);
  });

  testWidgets('FilledButtonTheme uses the primary color', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(),
      ),
    );

    final context = tester.element(find.byType(Scaffold));

    final style = Theme.of(context).filledButtonTheme.style!;

    expect(
      style.backgroundColor?.resolve({}),
      AppColors.primary,
    );

    expect(
      style.foregroundColor?.resolve({}),
      Colors.white,
    );
  });
}