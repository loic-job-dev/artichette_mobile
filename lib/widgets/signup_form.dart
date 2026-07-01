import 'package:flutter/material.dart';

import 'filled_button.dart';
import 'outlined_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: "Nom",
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),

        const SizedBox(height: 32),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: AppFilledButton(
            onPressed: () {
              // TODO: Create connexion logic
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