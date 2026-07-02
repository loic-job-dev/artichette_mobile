import '../../core/network/token_storage.dart';
import '../api/auth_api.dart';
import '../dto/login_request.dart';

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