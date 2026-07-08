import '../../auth_artichette.dart';
import '../api/auth_api.dart';
import '../models/login_request.dart';
import '../models/signup_request.dart';
import '../storage/token_storage.dart';

class AuthRepository {
  final TokenStorage storage;
  final AuthApi api;

  AuthRepository({
    required this.storage,
    required this.api,
  });

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> initialize() async {
    _isLoggedIn = await storage.getAccess() != null;
  }

  Future<void> login({required String password, required String email}) async {
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
    _isLoggedIn = true;
  }

  Future<void> logout() async {
    await storage.clear();
    _isLoggedIn = false;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String pseudo,
    required int streetNumber,
    required String streetType,
    required String streetName,
    String? addressComplement,
    required String zipCode,
    required String city,
    String? media,
  }) async {
    final response = await api.signUp(
      SignUpRequest(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        pseudo: pseudo,
        streetNumber: streetNumber,
        streetType: streetType,
        streetName: streetName,
        addressComplement: addressComplement,
        zipCode: zipCode,
        city: city,
        media: media,
      ),
    );
    await storage.save(
      response.accessToken,
      response.refreshToken,
    );
    _isLoggedIn = true;
  }
}