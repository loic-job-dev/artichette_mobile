import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_text_theme.dart';
import 'filled_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState ();
}

class _LoginFormState  extends State<LoginForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
     final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.login_signin,
          style: AppTextTheme.textTheme.displayMedium,
        ),

        const SizedBox(height: 12),

        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: passwordController,
          obscureText: _obscurePassword,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: l10n.login_passwordHint,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),

        const SizedBox(height: 32),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: AppFilledButton(
            onPressed: () async {
              try {
                await authRepository.login(
                   email: emailController.text,
                   password: passwordController.text,
                );
                if (!mounted) return;

                await context.read<UserViewModel>().load();
                context.go('/');
              } on ApiException catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.message),
                  ),
                );
              }
            },
            compact: false,
            child:  Text(l10n.login_connexion),
          ),
        ),

        const SizedBox(height: 12),

        TextButton(
          onPressed: () async {
            await authRepository.logout();
            context.read<UserViewModel>().clear();

            if (!mounted) return;
            context.go('/');
          },
          child:  Text(l10n.login_logout),
        ),
      ],
    );
  }
}