// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profile_pictureLinkLabel => 'Picture URL';

  @override
  String get profile_firstNameLabel => 'First name *';

  @override
  String get profile_firstNameRequired => 'Please enter a first name.';

  @override
  String get profile_firstNameTooLong => 'First name is too long (50 characters maximum).';

  @override
  String get profile_lastNameLabel => 'Last name *';

  @override
  String get profile_lastNameRequired => 'Please enter a last name.';

  @override
  String get profile_lastNameTooLong => 'Last name is too long (50 characters maximum).';

  @override
  String get profile_pseudoLabel => 'Username';

  @override
  String get profile_pseudoTooLong => 'Username is too long (50 characters maximum).';

  @override
  String get profile_emailLabel => 'Email *';

  @override
  String get profile_phoneNumberLabel => 'Phone number *';

  @override
  String get profile_phoneNumberRequired => 'Please enter a phone number.';

  @override
  String get profile_phoneNumberTooLong => 'Phone number is too long (15 characters maximum).';

  @override
  String get profile_streetNumberLabel => 'Street number *';

  @override
  String get profile_streetNumberRequired => 'Please enter a street number.';

  @override
  String get profile_streetNumberInvalid => 'Street number must be an integer.';

  @override
  String get profile_streetNumberPositive => 'Street number must be greater than 0.';

  @override
  String get profile_streetTypeLabel => 'Street type *';

  @override
  String get profile_streetTypeRequired => 'Please enter a street type.';

  @override
  String get profile_streetTypeTooLong => 'Street type is too long (10 characters maximum).';

  @override
  String get profile_streetNameLabel => 'Street name *';

  @override
  String get profile_streetNameRequired => 'Please enter a street name.';

  @override
  String get profile_streetNameTooLong => 'Street name is too long (50 characters maximum).';

  @override
  String get profile_addressComplementLabel => 'Address complement';

  @override
  String get profile_addressComplementTooLong => 'Address complement is too long (50 characters maximum).';

  @override
  String get profile_zipCodeLabel => 'ZIP code *';

  @override
  String get profile_zipCodeRequired => 'Please enter a ZIP code.';

  @override
  String get profile_zipCodeTooLong => 'ZIP code is too long (10 characters maximum).';

  @override
  String get profile_cityLabel => 'City *';

  @override
  String get profile_cityRequired => 'Please enter a city.';

  @override
  String get profile_cityTooLong => 'City name is too long (50 characters maximum).';

  @override
  String get profile_passwordLabel => 'Password *';

  @override
  String get profile_passwordRequired => 'Please enter your password.';

  @override
  String get profile_saveChangesButton => 'Save changes';

  @override
  String get profile_logoutButton => 'Log out';

  @override
  String get profile_implementationInProgressMessage => 'Implementation in progress';

  @override
  String get profile_saveSnackBarAction => 'Got it, I\'ll take a nap.';

  @override
  String get profile_logoutSnackBarAction => 'Got it, I\'ll have some tea.';

  @override
  String get auth_signup => 'Sign up';

  @override
  String get auth_signin => 'Sign in';

  @override
  String get navbar_home => 'Home';

  @override
  String get navbar_profile => 'Profile';

  @override
  String get navbar_signin => 'Sign in';

  @override
  String get bookingSummaryCard_confirmation => 'It\'s confirmed\n';

  @override
  String get bookingSummaryCard_description => 'Your stay at L\'Artichaut is booked.\nGet ready for a peaceful immersion in the heart of nature.';

  @override
  String bookingSummaryCard_nbNight(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString nights',
      one: '1 night',
    );
    return '$_temp0';
  }

  @override
  String get bookingSummaryCard_night => 'night';

  @override
  String get bookingSummaryCard_arrival => 'Arrival';

  @override
  String get bookingSummaryCard_leaving => 'Leaving';

  @override
  String get bookingSummaryCard_calendar => 'Add to calendar';

  @override
  String get bookingSummaryCard_home => 'Back home ➞';

  @override
  String get bookingSummaryCard_myBookings => 'My bookings';
}
