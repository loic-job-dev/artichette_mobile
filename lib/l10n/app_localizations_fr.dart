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

  @override
  String get auth_signup => 'Inscription';

  @override
  String get auth_signin => 'Connexion';

  @override
  String get navbar_home => 'Accueil';

  @override
  String get navbar_profile => 'Profil';

  @override
  String get navbar_signin => 'Se connecter';

  @override
  String get bookingSummaryCard_confirmation => 'C\'est confirmé\n';

  @override
  String get bookingSummaryCard_description => 'Votre séjour à l\'Artichaut est réservé.\nPréparez-vous pour une immersion sereine en pleine nature.';

  @override
  String bookingSummaryCard_nbNight(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString nuits',
      one: '1 nuit',
    );
    return '$_temp0';
  }

  @override
  String get bookingSummaryCard_night => 'nuit';

  @override
  String get bookingSummaryCard_arrival => 'Arrivée';

  @override
  String get bookingSummaryCard_leaving => 'Départ';

  @override
  String get bookingSummaryCard_calendar => 'Ajouter au calendrier';

  @override
  String get bookingSummaryCard_home => 'Retourner à l\'accueil ➞';

  @override
  String get bookingSummaryCard_myBookings => 'Voir mes réservations';

  @override
  String get dateRangePicker_chooseDate => 'Sélectionnez vos dates';

  @override
  String get dateRangePicker_month => 'Mois';

  @override
  String get dateRangePicker_validate => 'Valider';

  @override
  String get login_signin => 'Se connecter';

  @override
  String get login_passwordHint => 'Mot de passe';

  @override
  String get login_connexionOK => 'Connexion valide';

  @override
  String get login_connexion => 'Connexion';

  @override
  String get login_logout => 'Se déconnecter';

  @override
  String get roomPreviewCard_details => 'Détails';

  @override
  String get roomPreviewCard_bookingBtn => 'Réserver';

  @override
  String get signup_title => 'Créer un compte';

  @override
  String get signup_email => 'Email';

  @override
  String get signup_password => 'Mot de passe';

  @override
  String get signup_firstName => 'Prénom';

  @override
  String get signup_lastName => 'Nom';

  @override
  String get signup_phone => 'Téléphone';

  @override
  String get signup_pseudo => 'Pseudo';

  @override
  String get signup_streetNumber => 'Numéro';

  @override
  String get signup_streetNumberError => 'Le numéro de rue doit être un nombre valide.';

  @override
  String get signup_streetType => 'Type (rue, av...)';

  @override
  String get signup_streetName => 'Nom de rue';

  @override
  String get signup_addressComplement => 'Complément d\'adresse (optionnel)';

  @override
  String get signup_zipCode => 'Code postal';

  @override
  String get signup_city => 'Ville';

  @override
  String get signup_success => 'Compte créé avec succès';

  @override
  String get signup_errorUnexpected => 'Erreur inattendue';

  @override
  String get signup_submit => 'Créer un compte';

  @override
  String get signup_invalid_email => 'Merci de renseigner un email valide.';

  @override
  String get signup_password_too_short => 'Le mot de passe doit contenir au moins 8 caractères.';

  @override
  String get signup_missing_first_last_name => 'Merci de renseigner votre nom et prénom.';

  @override
  String get signup_invalid_phone => 'Merci de renseigner un numéro de téléphone valide.';

  @override
  String get signup_missing_pseudo => 'Merci de renseigner un pseudo.';

  @override
  String get signup_invalid_street_number => 'Merci de renseigner un numéro de rue valide.';

  @override
  String get signup_missing_street_type => 'Merci de renseigner un type de voie (rue, avenue...).';

  @override
  String get signup_missing_street_name => 'Merci de renseigner un nom de rue.';

  @override
  String get signup_invalid_zip_code => 'Merci de renseigner un code postal valide (5 chiffres).';

  @override
  String get signup_missing_city => 'Merci de renseigner une ville.';

  @override
  String get staySearchCard_stay => 'Séjour';

  @override
  String get staySearchCard_selectDates => 'Sélectionner les dates';

  @override
  String get staySearchCard_travelers => 'Voyageurs';

  @override
  String get staySearchCard_searchRoom => 'Rechercher une chambre';
}
