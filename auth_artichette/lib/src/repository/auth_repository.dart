import '../api/auth_api.dart';
import '../models/login_request.dart';
import '../storage/token_storage.dart';

class AuthRepository {
  final AuthApi api;
  final TokenStorage storage;

  AuthRepository({
    required this.api,
    required this.storage,
  });

  Future<void> login(String email, String password) async {
    final response = await api.login(
      LoginRequest(
        email: email,
        password: password,
      ),
    );

    await storage.save(
      response.accessToken,
      response.refreshToken,
    );
  }

  Future<void> logout() async {
    await storage.clear();
  }
}