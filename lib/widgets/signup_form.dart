import 'package:artichette/theme/app_text_theme.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final authRepository = context.read<AuthRepository>();

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
              onPressed: () async {
                try {
                  await authRepository.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phoneNumber: phoneController.text,
                    pseudo: pseudoController.text,
                    streetNumber: int.parse(streetNumberController.text),
                    streetType: streetTypeController.text,
                    streetName: streetNameController.text,
                    addressComplement: addressComplementController.text.isEmpty
                        ? null
                        : addressComplementController.text,
                    zipCode: zipCodeController.text,
                    city: cityController.text,
                  );

                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Compte créé avec succès"),
                    ),
                  );

                  // Navigation vers login ou home
                } on ApiException catch (e) {
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message),
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Erreur inattendue"),
                    ),
                  );
                }
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