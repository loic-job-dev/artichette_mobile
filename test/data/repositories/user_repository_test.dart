import 'package:artichette/data/api/user_api.dart';
import 'package:artichette/data/dto/user_update_request.dart';
import 'package:artichette/data/repositories/user_repository.dart';
import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserApi extends Mock implements UserApi {}

class FakeUserUpdateRequest extends Fake implements UserUpdateRequest {}

User fakeUser() {
  return const User(
    firstName: 'Jean',
    lastName: 'Dupont',
    phoneNumber: '0600000000',
    email: 'fake@mail.com',
    addresses: {
      Address(
        streetNumber: 1,
        streetType: 'rue',
        streetName: 'arti',
        zipCode: '64000',
        city: 'Pau',
      ),
    },
  );
}

void main() {
  late MockUserApi api;
  late UserRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeUserUpdateRequest());
  });

  setUp(() {
    api = MockUserApi();
    repository = UserRepository(api);
  });

  test('getMe returns mapped user', () async {
    when(() => api.getMe()).thenAnswer(
      (_) async => {
        "firstName": "Jean",
        "lastName": "Dupont",
        "phoneNumber": "0600000000",
        "email": "fake@mail.com",
        "streetNumber": 1,
        "streetType": "rue",
        "streetName": "arti",
        "zipCode": "64000",
        "city": "Pau",
      },
    );

    final result = await repository.getMe();
    final user = fakeUser();

    verify(() => api.getMe()).called(1);

    expect(user.firstName, result.firstName);
    expect(user.lastName, result.lastName);
    expect(user.email, result.email);
    expect(user.phoneNumber, result.phoneNumber);
    expect(result.addresses.length, 1);
  });

  test('updateMe sends correct request and returns mapped user', () async {
    when(() => api.updateMe(any())).thenAnswer(
      (_) async => {
        "firstName": "Jean",
        "lastName": "Dupont",
        "phoneNumber": "0600000000",
        "email": "fake@mail.com",
        "streetNumber": 1,
        "streetType": "rue",
        "streetName": "arti",
        "zipCode": "64000",
        "city": "Pau",
      },
    );

    final user = fakeUser();

    final result = await repository.updateMe(
      user: user,
      password: "password123",
    );

    final captured =
        verify(() => api.updateMe(captureAny())).captured.first
            as UserUpdateRequest;

    expect(captured.firstName, user.firstName);
    expect(captured.lastName, user.lastName);
    expect(captured.phoneNumber, user.phoneNumber);
    expect(captured.email, user.email);
    expect(captured.password, "password123");
    expect(captured.streetNumber, 1);
    expect(captured.city, "Pau");

    expect(user.firstName, result.firstName);
    expect(user.lastName, result.lastName);
    expect(user.email, result.email);
    expect(user.phoneNumber, result.phoneNumber);
    expect(result.addresses.length, 1);
  });

  test('getMe propagates api exceptions', () async {
    when(() => api.getMe()).thenThrow(Exception('API failed'));

    expect(() => repository.getMe(), throwsException);
  });

  test('updateMe propagates api exceptions', () async {
    when(() => api.updateMe(any())).thenThrow(Exception('API failed'));

    expect(
      () => repository.updateMe(user: fakeUser(), password: 'password123'),
      throwsException,
    );
  });
}
