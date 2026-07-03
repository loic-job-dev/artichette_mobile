import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:auth_artichette/auth_artichette.dart';

class MockTokenStorage extends Mock implements TokenStorage {}
class MockAuthApi extends Mock implements AuthApi {}

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest(email: '', password: ''));
  });
  late MockTokenStorage storage;
  late MockAuthApi api;
  late AuthRepository repository;

  setUp(() {
    storage = MockTokenStorage();
    api = MockAuthApi();

    repository = AuthRepository(
      storage: storage,
      api: api,
    );
  });

  test('login should call api and save tokens', () async {
    const email = 'test@test.com';
    const password = '1234';

    final response = AuthResponse(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      userId: '123',
      roles: ['USER'],
    );

    when(() => api.login(any()))
        .thenAnswer((_) async => response);

    when(() => storage.save(any(), any()))
        .thenAnswer((_) async {});

    await repository.login(email, password);

    verify(() => api.login(any())).called(1);

    verify(() => storage.save(
      'access_token',
      'refresh_token',
    )).called(1);
  });

  test('logout should clear storage', () async {
    when(() => storage.clear())
        .thenAnswer((_) async {});

    await repository.logout();

    verify(() => storage.clear()).called(1);
  });
}