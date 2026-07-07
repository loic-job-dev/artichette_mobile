class UserResponse {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? pseudo;
  final String email;
  final int streetNumber;
  final String streetType;
  final String streetName;
  final String? addressComplement;
  final String zipCode;
  final String city;
  final int nightNumber;
  final String media;
  final String loyaltyLevel;
  final int loyaltyDiscount;

  UserResponse({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.pseudo,
    required this.email,
    required this.streetNumber,
    required this.streetType,
    required this.streetName,
    this.addressComplement,
    required this.zipCode,
    required this.city,
    required this.nightNumber,
    required this.media,
    required this.loyaltyLevel,
    required this.loyaltyDiscount,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      firstName: json["firstname"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      streetNumber: json["streetNumber"],
      streetType: json["streetType"],
      streetName: json["streetName"],
      zipCode: json["zipCode"],
      city: json["city"],
      nightNumber: json["nightNumber"],
      media: json["media"],
      loyaltyLevel: json["loyaltyLevel"],
      loyaltyDiscount: json["loyaltyDiscount"],
    );
  }
}
