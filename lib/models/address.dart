class Address {
  final int streetNumber;
  final String streetType;
  final String streetName;
  final String? addressComplement;
  final String zipCode;
  final String city;

  const Address({
    required this.streetNumber,
    required this.streetType,
    required this.streetName,
    this.addressComplement,
    required this.zipCode,
    required this.city,
  });

  String get fullAddress {
    final buffer = StringBuffer(
      "$streetNumber $streetType $streetName",
    );

    if (addressComplement != null &&
        addressComplement!.trim().isNotEmpty) {
      buffer.write(", $addressComplement");
    }

    buffer.write(", $zipCode $city");

    return buffer.toString();
  }
}