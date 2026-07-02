import 'package:artichette/core/network/token_storage.dart';
import 'package:flutter/material.dart';

import '../core/network/dio_client.dart';
import '../theme/app_text_theme.dart';
import 'filled_button.dart';
import 'outlined_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<LoginForm> {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Se connecter",
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
            hintText: "Mot de passe",
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
                await DioClient.authRepository.login(
                  emailController.text,
                  passwordController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Connexion valide",
                    ),
                  ),
                );
                // Navigation vers l'accueil
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  ),
                );
              }
            },
            compact: false,
            child: const Text("Connexion"),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child:AppOutlinedButton(
            onPressed: () {
              // TODO: create account logic
            },
            compact: false,
            child: const Text("Créer un compte"),
          ),
        ),


        const SizedBox(height: 12),

        TextButton(
          onPressed: () {
            // TODO: forgot password navigation
          },
          child: const Text("Mot de passe oublié"),
        ),
      ],
    );
  }
}