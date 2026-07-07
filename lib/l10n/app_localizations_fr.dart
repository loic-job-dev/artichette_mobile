// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get profile_pictureLinkLabel => 'Lien vers votre photo';

  @override
  String get profile_firstNameLabel => 'Prénom *';

  @override
  String get profile_firstNameRequired => 'Veuillez saisir un prénom.';

  @override
  String get profile_firstNameTooLong => 'Le prénom est trop long (50 caractères maximum).';

  @override
  String get profile_lastNameLabel => 'Nom *';

  @override
  String get profile_lastNameRequired => 'Veuillez saisir un nom.';

  @override
  String get profile_lastNameTooLong => 'Le nom est trop long (50 caractères maximum).';

  @override
  String get profile_pseudoLabel => 'Pseudo';

  @override
  String get profile_pseudoTooLong => 'Le pseudo est trop long (50 caractères maximum).';

  @override
  String get profile_emailLabel => 'Email *';

  @override
  String get profile_phoneNumberLabel => 'Numéro de téléphone *';

  @override
  String get profile_phoneNumberRequired => 'Veuillez saisir un numéro de téléphone.';

  @override
  String get profile_phoneNumberTooLong => 'Le numéro de téléphone est trop long (15 caractères maximum).';

  @override
  String get profile_streetNumberLabel => 'N° Rue *';

  @override
  String get profile_streetNumberRequired => 'Veuillez saisir un numéro de rue.';

  @override
  String get profile_streetNumberInvalid => 'Le numéro doit être un entier.';

  @override
  String get profile_streetNumberPositive => 'Le numéro doit être supérieur à 0.';

  @override
  String get profile_streetTypeLabel => 'Type de voie *';

  @override
  String get profile_streetTypeRequired => 'Veuillez saisir un type de voie.';

  @override
  String get profile_streetTypeTooLong => 'Le type de voie est trop long (10 caractères maximum).';

  @override
  String get profile_streetNameLabel => 'Nom de la voie *';

  @override
  String get profile_streetNameRequired => 'Veuillez saisir un nom de voie.';

  @override
  String get profile_streetNameTooLong => 'Le nom de la voie est trop long (50 caractères maximum).';

  @override
  String get profile_addressComplementLabel => 'Complément d\'adresse';

  @override
  String get profile_addressComplementTooLong => 'Le complément d\'adresse est trop long (50 caractères maximum).';

  @override
  String get profile_zipCodeLabel => 'Code postal *';

  @override
  String get profile_zipCodeRequired => 'Veuillez saisir un code postal.';

  @override
  String get profile_zipCodeTooLong => 'Le code postal est trop long (10 caractères maximum).';

  @override
  String get profile_cityLabel => 'Ville *';

  @override
  String get profile_cityRequired => 'Veuillez saisir une ville.';

  @override
  String get profile_cityTooLong => 'Le nom de la ville est trop long (50 caractères maximum).';

  @override
  String get profile_passwordLabel => 'Mot de passe *';

  @override
  String get profile_passwordRequired => 'Veuillez saisir votre mot de passe.';

  @override
  String get profile_saveChangesButton => 'Enregistrer les modifications';

  @override
  String get profile_logoutButton => 'Se déconnecter';

  @override
  String get profile_implementationInProgressMessage => 'Implémentation en cours';

  @override
  String get profile_saveSnackBarAction => 'C\'est compris, je vais faire une sieste.';

  @override
  String get profile_logoutSnackBarAction => 'C\'est compris, je vais prendre un thé.';
}
