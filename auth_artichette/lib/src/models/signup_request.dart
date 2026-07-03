class SignUpRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pseudo;

  final int streetNumber;
  final String streetType;
  final String streetName;

  final String? addressComplement;
  final String zipCode;
  final String city;

  final String? media;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.pseudo,
    required this.streetNumber,
    required this.streetType,
    required this.streetName,
    this.addressComplement,
    required this.zipCode,
    required this.city,
    this.media,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'pseudo': pseudo,
      'streetNumber': streetNumber,
      'streetType': streetType,
      'streetName': streetName,
      'addressComplement': addressComplement,
      'zipCode': zipCode,
      'city': city,
      'media': media,
    };
  }
}