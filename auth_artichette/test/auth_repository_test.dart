import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:auth_artichette/src/repository/auth_repository.dart';
import 'package:auth_artichette/src/api/auth_api.dart';
import 'package:auth_artichette/src/models/login_request.dart';
import 'package:auth_artichette/src/models/auth_response.dart';
import 'package:auth_artichette/src/storage/token_storage.dart';

/// MOCKS

class MockAuthApi extends Mock implements AuthApi {}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest(email: '', password: ''));
  });
  late MockAuthApi api;
  late MockTokenStorage storage;
  late AuthRepository repository;

  setUp(() {
    api = MockAuthApi();
    storage = MockTokenStorage();

    repository = AuthRepository(
      api: api,
      storage: storage,
    );
  });

  test('login should call api and save tokens', () async {
    // ARRANGE
    const email = 'test@test.com';
    const password = '1234';

    final response = AuthResponse(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      userId: '123',
      roles: ['USER'],
    );

    when(() => api.login(any())).thenAnswer((_) async => response);

    when(() => storage.save(any(), any()))
        .thenAnswer((_) async {});

    // ACT
    await repository.login(email, password);

    // ASSERT
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