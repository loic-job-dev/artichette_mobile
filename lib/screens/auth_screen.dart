import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/widgets/login_form.dart';
import 'package:artichette/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _selected = AuthMode.login;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SegmentedButton<AuthMode>(
            segments: [
              ButtonSegment(value: AuthMode.login, label: Text(l10n.auth_signup)),
              ButtonSegment(
                value: AuthMode.register,
                label: Text(l10n.auth_signin),
              ),
            ],
            selected: {_selected},
            onSelectionChanged: (value) {
              setState(() {
                _selected = value.first;
              });
            },
          ),

          const SizedBox(height: 24),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 0),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _selected == AuthMode.login
                ? const LoginForm(key: ValueKey('login'))
                : const SignupForm(key: ValueKey('register')),
          ),
        ],
      ),
    );
  }
}

enum AuthMode { login, register }
