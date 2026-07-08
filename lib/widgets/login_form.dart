import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../theme/app_color.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_theme.dart';
import 'custom_input.dart';
import 'filled_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  final void Function(String message) onError;

  const LoginForm({super.key, required this.onError});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.login_signin,
            style: AppTextTheme.textTheme.displayMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.login_subtitle,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          CustomInput(
            label: l10n.signup_email,
            hintText: l10n.signup_emailHint,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: AppSpacing.md),
          CustomInput(
            label: l10n.login_passwordHint,
            hintText: "••••••••",
            controller: passwordController,
            obscureText: _obscurePassword,
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                l10n.login_forgotPassword,
                style: const TextStyle(
                  color: Color.fromARGB(255, 16, 44, 36),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppFilledButton(
            onPressed: () async {
              try {
                await authRepository.login(
                  email: emailController.text.trim(),
                  password: passwordController.text,
                );
                if (!mounted) return;
                await context.read<UserViewModel>().load();
                context.go('/');
              } on ApiException catch (e) {
                print('heee : ${e.runtimeType}');
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.message),
                    backgroundColor: AppColors.error,
                  ),
                );
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.signup_errorUnexpected),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            compact: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.login_connexion),
                const SizedBox(width: AppSpacing.xs),
                const Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
