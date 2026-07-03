import 'package:dio/dio.dart';

import '../../auth_artichette.dart';
import '../api/auth_api.dart';
import '../models/login_request.dart';
import '../models/signup_request.dart';
import '../storage/token_storage.dart';

class AuthRepository {
  final TokenStorage storage;
  final Dio dio;

  AuthRepository({
    required this.storage,
    required this.dio,
  });

  late AuthApi api = AuthApi(dio);

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
  }
}