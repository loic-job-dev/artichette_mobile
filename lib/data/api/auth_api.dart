import 'package:dio/dio.dart';

import '../dto/auth_response.dart';
import '../dto/login_request.dart';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<AuthResponse> login(LoginRequest request) async {
    final res = await dio.post(
      '/auth/login',
      data: request.toJson(),
    );

    return AuthResponse.fromJson(res.data);
  }
}