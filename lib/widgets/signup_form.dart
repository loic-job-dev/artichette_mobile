import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/theme/app_text_theme.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:artichette/widgets/custom_input.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filled_button.dart';

class SignupForm extends StatefulWidget {
  final void Function(String message) onError;
  const SignupForm({super.key, required this.onError});

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.signup_title,
            textAlign: TextAlign.center,
            style: AppTextTheme.textTheme.displayMedium?.copyWith(
              color: const Color(0xFF1C3130),
            ),
          ),

          const SizedBox(height: 24),

          CustomInput(
            label: l10n.signup_email,
            hintText: "nom@exemple.com",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline_rounded,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_password,
            hintText: "••••••••",
            controller: passwordController,
            obscureText: true,
            prefixIcon: Icons.lock_outline_rounded,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_firstName,
            hintText: l10n.signup_firstName,
            controller: firstNameController,
            prefixIcon: Icons.person_outline,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_lastName,
            hintText: l10n.signup_lastName,
            controller: lastNameController,
            prefixIcon: Icons.person_outline,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_phone,
            hintText: "06 00 00 00 00",
            controller: phoneController,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone_outlined,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_pseudo,
            hintText: l10n.signup_pseudo,
            controller: pseudoController,
            prefixIcon: Icons.alternate_email_outlined,
          ),

          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: CustomInput(
                  label: l10n.signup_streetNumber,
                  hintText: "12",
                  controller: streetNumberController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: CustomInput(
                  label: l10n.signup_streetType,
                  hintText: "Rue, Av, Bd...",
                  controller: streetTypeController,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_streetName,
            hintText: l10n.signup_streetName,
            controller: streetNameController,
            prefixIcon: Icons.map_outlined,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_addressComplement,
            hintText: l10n.signup_addressComplement,
            controller: addressComplementController,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_zipCode,
            hintText: "75000",
            controller: zipCodeController,
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 16),

          CustomInput(
            label: l10n.signup_city,
            hintText: l10n.signup_city,
            controller: cityController,
            prefixIcon: Icons.location_city_outlined,
          ),

          const SizedBox(height: 32),

          AppFilledButton(
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

                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.signup_success)));

                await context.read<UserViewModel>().load();
              } on ApiException catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.message)));
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.signup_errorUnexpected)),
                );
              }
            },
            compact: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.signup_submit),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 18, color: Colors.white),
              ],
            ),
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
                final validationError = _validate();
                if (validationError != null) {
                  widget.onError(validationError);
                  return;
                }
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

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(l10n.signup_success)));

                  await context.read<UserViewModel>().load();

                  // Navigation vers login ou home
                } on ApiException catch (e) {
                  if (!mounted) return;
                  widget.onError(e.message);
                } on FormatException {
                  if (!mounted) return;
                  widget.onError(l10n.signup_streetNumberError);
                } catch (e) {
                  if (!mounted) return;
                  widget.onError(l10n.signup_errorUnexpected);
                }
              },
              compact: false,
              child: Text(l10n.signup_submit),
            ),
          ),
        ],
      ),
    );
  }

  String? _validate() {
    final l10n = AppLocalizations.of(context)!;
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      return l10n.signup_invalid_email;
    }
    if (passwordController.text.length < 8) {
      return l10n.signup_password_too_short;
    }
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
      return l10n.signup_missing_first_last_name;
    }
    if (phoneController.text.isEmpty ||
        !RegExp(
          r'^0[1-9](\d{2}){4}$',
        ).hasMatch(phoneController.text.replaceAll(' ', ''))) {
      return l10n.signup_invalid_phone;
    }
    if (pseudoController.text.isEmpty) {
      return l10n.signup_missing_pseudo;
    }
    if (streetNumberController.text.isEmpty ||
        int.tryParse(streetNumberController.text) == null) {
      return l10n.signup_invalid_street_number;
    }
    if (streetTypeController.text.isEmpty) {
      return l10n.signup_missing_street_type;
    }
    if (streetNameController.text.isEmpty) {
      return l10n.signup_missing_street_name;
    }
    if (zipCodeController.text.isEmpty ||
        !RegExp(r'^\d{5}$').hasMatch(zipCodeController.text)) {
      return l10n.signup_invalid_zip_code;
    }
    if (cityController.text.isEmpty) {
      return l10n.signup_missing_city;
    }
    return null;
  }
}
