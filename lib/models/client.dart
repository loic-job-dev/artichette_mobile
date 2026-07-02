import 'address.dart';

class Client {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final Set<Address> addresses;

  const Client({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.addresses,
  });

  String get fullName => "$firstName $lastName";
}