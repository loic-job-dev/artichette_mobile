class UserUpdateRequest {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? pseudo;
  final String? email;
  final int streetNumber;
  final String streetType;
  final String streetName;
  final String? addressComplement;
  final String zipCode;
  final String city;
  final String password;

  UserUpdateRequest({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.pseudo,
    this.email,
    required this.streetNumber,
    required this.streetType,
    required this.streetName,
    this.addressComplement,
    required this.zipCode,
    required this.city,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'pseudo': pseudo,
      'email': email,
      'streetNumber': streetNumber,
      'streetType': streetType,
      'streetName': streetName,
      'addressComplement': addressComplement,
      'zipCode': zipCode,
      'city': city,
      'password': password,
    };
  }
}
