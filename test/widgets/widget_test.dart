import 'package:artichette/theme/app_color.dart';
import 'package:artichette/theme/app_theme.dart';
import 'package:artichette/widgets/filled_button.dart';
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

  testWidgets('AppFilledButton uses theme colors', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppFilledButton(
            onPressed: () {},
            child: const Text('test'),
          ),
        ),
      ),
    );

    final button = tester.widget<FilledButton>(
      find.byType(FilledButton),
    );

    final style = button.style!;

    final background = style.backgroundColor?.resolve({});
    final foreground = style.foregroundColor?.resolve({});

    expect(background, AppColors.primary);
    expect(
      style.foregroundColor?.resolve({}),
      AppColors.accent,
    );
  });
}