import 'package:artichette/core/network/token_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenStorage storage;

  bool _isRefreshing = false;
  final List<Function(String)> _queue = [];

  AuthInterceptor({
    required this.dio,
    required this.storage,
  });

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getAccess();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (options.path == '/auth/refresh') {
      return handler.next(options);
    }

    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await storage.getRefresh();
    if (refreshToken == null) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      _queue.add((newToken) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        dio.fetch(err.requestOptions).then(
              (r) => handler.resolve(r),
        );
      });
      return;
    }

    _isRefreshing = true;

    try {
      final newTokens = await _refresh(refreshToken);

      await storage.save(newTokens['access']!, newTokens['refresh']!);

      for (final callback in _queue) {
        callback(newTokens['access']!);
      }

      _queue.clear();

      final request = err.requestOptions;
      request.headers['Authorization'] = 'Bearer ${newTokens['access']}';

      final response = await dio.fetch(request);
      handler.resolve(response);
    } catch (e) {
      await storage.clear();
      handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Map<String, String>> _refresh(String refreshToken) async {
    final response = await dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    return {
      'access': response.data['token'],
      'refresh': response.data['refreshToken'],
    };
  }
}