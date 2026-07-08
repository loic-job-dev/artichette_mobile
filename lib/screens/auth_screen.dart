import 'package:artichette/core/network/api_config.dart';
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
  String? _errorMessage;

  void _handleError(String message) {
    setState(() => _errorMessage = message);
  }
/*
  void _clearError() {
    if (_errorMessage != null) {
      setState(() => _errorMessage = null);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //debug print
          Text(ApiConfig.baseUrl),
          SegmentedButton<AuthMode>(
            segments: [
              ButtonSegment(value: AuthMode.login, label: Text(l10n.auth_signin)),
              ButtonSegment(
                value: AuthMode.register,
                label: Text(l10n.auth_signup),
              ),
            ],
            selected: {_selected},
            onSelectionChanged: (value) {
              setState(() {
                _selected = value.first;
                _errorMessage = null;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_errorMessage != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _selected == AuthMode.login
                ? LoginForm(key: ValueKey(l10n.auth_signin), onError: _handleError)
                : SignupForm(
                    key:  ValueKey(l10n.auth_signup),
                    onError: _handleError,
                  ),
          ),
        ],
      ),
    );
  }
}

enum AuthMode { login, register }
