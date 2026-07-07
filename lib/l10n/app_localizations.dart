import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @profile_pictureLinkLabel.
  ///
  /// In en, this message translates to:
  /// **'Picture URL'**
  String get profile_pictureLinkLabel;

  /// No description provided for @profile_firstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First name *'**
  String get profile_firstNameLabel;

  /// No description provided for @profile_firstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a first name.'**
  String get profile_firstNameRequired;

  /// No description provided for @profile_firstNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'First name is too long (50 characters maximum).'**
  String get profile_firstNameTooLong;

  /// No description provided for @profile_lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last name *'**
  String get profile_lastNameLabel;

  /// No description provided for @profile_lastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a last name.'**
  String get profile_lastNameRequired;

  /// No description provided for @profile_lastNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Last name is too long (50 characters maximum).'**
  String get profile_lastNameTooLong;

  /// No description provided for @profile_pseudoLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get profile_pseudoLabel;

  /// No description provided for @profile_pseudoTooLong.
  ///
  /// In en, this message translates to:
  /// **'Username is too long (50 characters maximum).'**
  String get profile_pseudoTooLong;

  /// No description provided for @profile_emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email *'**
  String get profile_emailLabel;

  /// No description provided for @profile_phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number *'**
  String get profile_phoneNumberLabel;

  /// No description provided for @profile_phoneNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number.'**
  String get profile_phoneNumberRequired;

  /// No description provided for @profile_phoneNumberTooLong.
  ///
  /// In en, this message translates to:
  /// **'Phone number is too long (15 characters maximum).'**
  String get profile_phoneNumberTooLong;

  /// No description provided for @profile_streetNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Street number *'**
  String get profile_streetNumberLabel;

  /// No description provided for @profile_streetNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a street number.'**
  String get profile_streetNumberRequired;

  /// No description provided for @profile_streetNumberInvalid.
  ///
  /// In en, this message translates to:
  /// **'Street number must be an integer.'**
  String get profile_streetNumberInvalid;

  /// No description provided for @profile_streetNumberPositive.
  ///
  /// In en, this message translates to:
  /// **'Street number must be greater than 0.'**
  String get profile_streetNumberPositive;

  /// No description provided for @profile_streetTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Street type *'**
  String get profile_streetTypeLabel;

  /// No description provided for @profile_streetTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a street type.'**
  String get profile_streetTypeRequired;

  /// No description provided for @profile_streetTypeTooLong.
  ///
  /// In en, this message translates to:
  /// **'Street type is too long (10 characters maximum).'**
  String get profile_streetTypeTooLong;

  /// No description provided for @profile_streetNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Street name *'**
  String get profile_streetNameLabel;

  /// No description provided for @profile_streetNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a street name.'**
  String get profile_streetNameRequired;

  /// No description provided for @profile_streetNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Street name is too long (50 characters maximum).'**
  String get profile_streetNameTooLong;

  /// No description provided for @profile_addressComplementLabel.
  ///
  /// In en, this message translates to:
  /// **'Address complement'**
  String get profile_addressComplementLabel;

  /// No description provided for @profile_addressComplementTooLong.
  ///
  /// In en, this message translates to:
  /// **'Address complement is too long (50 characters maximum).'**
  String get profile_addressComplementTooLong;

  /// No description provided for @profile_zipCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'ZIP code *'**
  String get profile_zipCodeLabel;

  /// No description provided for @profile_zipCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a ZIP code.'**
  String get profile_zipCodeRequired;

  /// No description provided for @profile_zipCodeTooLong.
  ///
  /// In en, this message translates to:
  /// **'ZIP code is too long (10 characters maximum).'**
  String get profile_zipCodeTooLong;

  /// No description provided for @profile_cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City *'**
  String get profile_cityLabel;

  /// No description provided for @profile_cityRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a city.'**
  String get profile_cityRequired;

  /// No description provided for @profile_cityTooLong.
  ///
  /// In en, this message translates to:
  /// **'City name is too long (50 characters maximum).'**
  String get profile_cityTooLong;

  /// No description provided for @profile_passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password *'**
  String get profile_passwordLabel;

  /// No description provided for @profile_passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password.'**
  String get profile_passwordRequired;

  /// No description provided for @profile_saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get profile_saveChangesButton;

  /// No description provided for @profile_logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get profile_logoutButton;

  /// No description provided for @profile_implementationInProgressMessage.
  ///
  /// In en, this message translates to:
  /// **'Implementation in progress'**
  String get profile_implementationInProgressMessage;

  /// No description provided for @profile_saveSnackBarAction.
  ///
  /// In en, this message translates to:
  /// **'Got it, I\'ll take a nap.'**
  String get profile_saveSnackBarAction;

  /// No description provided for @profile_logoutSnackBarAction.
  ///
  /// In en, this message translates to:
  /// **'Got it, I\'ll have some tea.'**
  String get profile_logoutSnackBarAction;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
