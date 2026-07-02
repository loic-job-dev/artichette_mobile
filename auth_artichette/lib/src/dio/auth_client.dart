import 'package:dio/dio.dart';

import '../storage/token_storage.dart';

class AuthClient {
  final Dio dio;
  final TokenStorage storage;

  AuthClient({
    required this.dio,
    required this.storage,
  });
}

// Côté app :
// final dio = Dio(BaseOptions(
//   baseUrl: ApiConfig.baseUrl,
// ));
//
// final authRepository = AuthRepository(
//   api: AuthApi(dio),
//   storage: TokenStorage(),
// );