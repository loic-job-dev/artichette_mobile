import 'package:auth_artichette/auth_artichette.dart';
import 'package:dio/dio.dart';
import 'api_config.dart';

class DioClient {
  final Dio dio;

  DioClient._(this.dio);

  factory DioClient(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
        storage: storage,
      ),
    );

    return DioClient._(dio);
  }
}