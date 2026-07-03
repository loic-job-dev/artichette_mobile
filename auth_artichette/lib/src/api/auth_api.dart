import 'package:dio/dio.dart';

import '../models/auth_response.dart';
import '../models/login_request.dart';
import 'api_exception.dart';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final res = await dio.post(
        '/auth/login',
        data: request.toJson(),
      );

      return AuthResponse.fromJson(res.data);
    } on DioException catch (e) {
      throw ApiException(
        statusCode: e.response?.statusCode,
        message: _extractMessage(e),
      );
    }
  }

  String _extractMessage(DioException e) {
    final data = e.response?.data;

    if (data is String) {
      return data;
    }

    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ?? 'Erreur inconnue';
    }

    return e.message ?? 'Erreur inconnue';
  }
}