import 'package:artichette/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson create User correctly', () {
    final json = {
      "firstName": "Jean",
      "lastName": "Dupont",
      "phoneNumber": "0600000000",
      "email": "fake@mail.com",
      "addresses": [
        {
          "streetNumber": 1,
          "streetType": "rue",
          "streetName": "arti",
          "zipCode": "64000",
          "city": "Pau",
        },
      ],
    };

    final user = User.fromJson(json);

    expect(user.firstName, "Jean");
    expect(user.lastName, "Dupont");
    expect(user.email, "fake@mail.com");
    expect(user.phoneNumber, "0600000000");
    expect(user.addresses.length, 1);
  });

  test('fromJsonUserResponse create User correctly', () {
    final json = {
      "firstName": "Jean",
      "lastName": "Dupont",
      "phoneNumber": "0600000000",
      "email": "fake@mail.com",
      "streetNumber": 1,
      "streetType": "rue",
      "streetName": "arti",
      "zipCode": "64000",
      "city": "Pau",
    };

    final user = User.fromJsonUserResponse(json);

    expect(user.firstName, "Jean");
    expect(user.lastName, "Dupont");
    expect(user.email, "fake@mail.com");
    expect(user.phoneNumber, "0600000000");
    expect(user.addresses.length, 1);
  });
}
