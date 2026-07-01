import 'package:artichette/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

import 'filled_button.dart';
import 'outlined_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final pseudoController = TextEditingController();

  final streetNumberController = TextEditingController();
  final streetTypeController = TextEditingController();
  final streetNameController = TextEditingController();
  final addressComplementController = TextEditingController();

  final zipCodeController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    pseudoController.dispose();
    streetNumberController.dispose();
    streetTypeController.dispose();
    streetNameController.dispose();
    addressComplementController.dispose();
    zipCodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Créer un compte",
            style: AppTextTheme.textTheme.displayMedium,
          ),

          const SizedBox(height: 12),

          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Mot de passe"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(hintText: "Prénom"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(hintText: "Nom"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "Téléphone"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: pseudoController,
            decoration: const InputDecoration(hintText: "Pseudo"),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: streetNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Numéro"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: streetTypeController,
                  decoration: const InputDecoration(hintText: "Type (rue, av...)"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          TextField(
            controller: streetNameController,
            decoration: const InputDecoration(hintText: "Nom de rue"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: addressComplementController,
            decoration: const InputDecoration(hintText: "Complément d'adresse (optionnel)"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: zipCodeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Code postal"),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: cityController,
            decoration: const InputDecoration(hintText: "Ville"),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AppFilledButton(
              onPressed: () {
                // TODO: create signup logic
              },
              compact: false,
              child: const Text("Créer un compte"),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AppOutlinedButton(
              onPressed: () {
                // TODO : create navigation between screens
              },
              compact: false,
              child: const Text("Accueil"),
            ),
          ),
        ],
      ),
    );
  }
}