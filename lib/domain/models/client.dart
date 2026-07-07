import 'address.dart';

class Client {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? pseudo;
  final Set<Address> addresses;

  const Client({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.pseudo,
    required this.addresses,
  });

  String get fullName => "$firstName $lastName";

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      pseudo: json['pseudo'],
      addresses: (json['addresses'] as List?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toSet() ??
          <Address>{},
    );
  }
}