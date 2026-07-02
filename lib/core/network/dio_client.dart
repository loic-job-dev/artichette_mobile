import 'package:artichette/core/network/token_storage.dart';
import 'package:dio/dio.dart';

import '../../data/api/auth_api.dart';
import '../../data/repositories/auth_repository.dart';
import 'api_config.dart';
import 'auth_interceptor.dart';

class DioClient {
  static late final Dio dio;
  static late final TokenStorage tokenStorage;

  static late final AuthApi authApi;
  static late final AuthRepository authRepository;

  static void init() {
    tokenStorage = TokenStorage();

    dio = _createDio(tokenStorage);

    authApi = AuthApi(dio);

    authRepository = AuthRepository(
      api: authApi,
      storage: tokenStorage,
    );
  }

  static Dio _createDio(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        storage: storage,
      ),
    );

    return dio;
  }
}