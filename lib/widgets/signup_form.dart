import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/theme/app_text_theme.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filled_button.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.signup_title, style: AppTextTheme.textTheme.displayMedium),

          const SizedBox(height: 12),

          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: l10n.signup_email),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(hintText: l10n.signup_password),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: firstNameController,
            decoration: InputDecoration(hintText: l10n.signup_firstName),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: lastNameController,
            decoration: InputDecoration(hintText: l10n.signup_lastName),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: l10n.signup_phone),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: pseudoController,
            decoration: InputDecoration(hintText: l10n.signup_pseudo),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: streetNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: l10n.signup_streetNumber,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: streetTypeController,
                  decoration: InputDecoration(hintText: l10n.signup_streetType),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          TextField(
            controller: streetNameController,
            decoration: InputDecoration(hintText: l10n.signup_streetName),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: addressComplementController,
            decoration: InputDecoration(
              hintText: l10n.signup_addressComplement,
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: zipCodeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: l10n.signup_zipCode),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: cityController,
            decoration: InputDecoration(hintText: l10n.signup_city),
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
                     SnackBar(content: Text(l10n.signup_success)),
                  );
                  
                  await context.read<UserViewModel>().load();

                  // Navigation vers login ou home
                } on ApiException catch (e) {
                  if (!mounted) return;

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.message)));
                } catch (e) {
                  if (!mounted) return;

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(l10n.signup_errorUnexpected)));
                }
              },
              compact: false,
              child:  Text(l10n.signup_submit),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
