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

  /// No description provided for @profile_saveSnackBarConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Changes saved.'**
  String get profile_saveSnackBarConfirmation;

  /// No description provided for @auth_signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get auth_signup;

  /// No description provided for @auth_signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get auth_signin;

  /// No description provided for @navbar_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navbar_home;

  /// No description provided for @navbar_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navbar_profile;

  /// No description provided for @navbar_signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get navbar_signin;

  /// No description provided for @bookingSummaryCard_confirmation.
  ///
  /// In en, this message translates to:
  /// **'It\'s confirmed\n'**
  String get bookingSummaryCard_confirmation;

  /// No description provided for @bookingSummaryCard_description.
  ///
  /// In en, this message translates to:
  /// **'Your stay at L\'Artichaut is booked.\nGet ready for a peaceful immersion in the heart of nature.'**
  String get bookingSummaryCard_description;

  /// No description provided for @bookingSummaryCard_nbNight.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 night} other{{count} nights}}'**
  String bookingSummaryCard_nbNight(num count);

  /// No description provided for @bookingSummaryCard_night.
  ///
  /// In en, this message translates to:
  /// **'night'**
  String get bookingSummaryCard_night;

  /// No description provided for @bookingSummaryCard_arrival.
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get bookingSummaryCard_arrival;

  /// No description provided for @bookingSummaryCard_leaving.
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get bookingSummaryCard_leaving;

  /// No description provided for @bookingSummaryCard_calendar.
  ///
  /// In en, this message translates to:
  /// **'Add to calendar'**
  String get bookingSummaryCard_calendar;

  /// No description provided for @bookingSummaryCard_home.
  ///
  /// In en, this message translates to:
  /// **'Back to home ➞'**
  String get bookingSummaryCard_home;

  /// No description provided for @bookingSummaryCard_myBookings.
  ///
  /// In en, this message translates to:
  /// **'View my bookings'**
  String get bookingSummaryCard_myBookings;

  /// No description provided for @dateRangePicker_chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Select your dates'**
  String get dateRangePicker_chooseDate;

  /// No description provided for @dateRangePicker_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get dateRangePicker_month;

  /// No description provided for @dateRangePicker_validate.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get dateRangePicker_validate;

  /// No description provided for @login_signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login_signin;

  /// No description provided for @login_passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_passwordHint;

  /// No description provided for @login_connexionOK.
  ///
  /// In en, this message translates to:
  /// **'Connection OK'**
  String get login_connexionOK;

  /// No description provided for @login_connexion.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login_connexion;

  /// No description provided for @login_forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get login_forgotPassword;

  /// No description provided for @login_logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get login_logout;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your escape.'**
  String get login_subtitle;

  /// No description provided for @roomPreviewCard_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get roomPreviewCard_details;

  /// No description provided for @roomPreviewCard_bookingBtn.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get roomPreviewCard_bookingBtn;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get signup_title;

  /// No description provided for @signup_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signup_email;

  /// No description provided for @signup_emailHint.
  ///
  /// In en, this message translates to:
  /// **'example@mail.com'**
  String get signup_emailHint;

  /// No description provided for @signup_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signup_password;

  /// No description provided for @signup_firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get signup_firstName;

  /// No description provided for @signup_lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get signup_lastName;

  /// No description provided for @signup_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get signup_phone;

  /// No description provided for @signup_pseudo.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get signup_pseudo;

  /// No description provided for @signup_streetNumber.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get signup_streetNumber;

  /// No description provided for @signup_streetType.
  ///
  /// In en, this message translates to:
  /// **'Type (street, avenue...)'**
  String get signup_streetType;

  /// No description provided for @signup_streetName.
  ///
  /// In en, this message translates to:
  /// **'Street name'**
  String get signup_streetName;

  /// No description provided for @signup_addressComplement.
  ///
  /// In en, this message translates to:
  /// **'Address complement (optional)'**
  String get signup_addressComplement;

  /// No description provided for @signup_zipCode.
  ///
  /// In en, this message translates to:
  /// **'ZIP code'**
  String get signup_zipCode;

  /// No description provided for @signup_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get signup_city;

  /// No description provided for @signup_success.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get signup_success;

  /// No description provided for @signup_errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error'**
  String get signup_errorUnexpected;

  /// No description provided for @signup_submit.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get signup_submit;

  /// No description provided for @staySearchCard_stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get staySearchCard_stay;

  /// No description provided for @staySearchCard_selectDates.
  ///
  /// In en, this message translates to:
  /// **'Select dates'**
  String get staySearchCard_selectDates;

  /// No description provided for @staySearchCard_travelers.
  ///
  /// In en, this message translates to:
  /// **'Travelers'**
  String get staySearchCard_travelers;

  /// No description provided for @staySearchCard_searchRoom.
  ///
  /// In en, this message translates to:
  /// **'Search for a room'**
  String get staySearchCard_searchRoom;
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
