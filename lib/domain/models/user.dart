import 'package:artichette/data/dto/user_update_request.dart';

import 'address.dart';

class User {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? pseudo;
  final String email;
  final String? media;
  final Set<Address> addresses;

  const User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.pseudo,
    required this.email,
    this.media,
    required this.addresses,
  });

  String get fullName => "$firstName $lastName";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      pseudo: json['pseudo'],
      email: json['email'],
      media: json['media'],
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );
  }

  UserUpdateRequest toUpdateRequest({required String password}) {
    return UserUpdateRequest(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      pseudo: pseudo,
      email: email,
      streetNumber: addresses.first.streetNumber,
      streetType: addresses.first.streetType,
      streetName: addresses.first.streetName,
      addressComplement: addresses.first.addressComplement,
      zipCode: addresses.first.zipCode,
      city: addresses.first.city,
      password: password,
    );
  }
}
