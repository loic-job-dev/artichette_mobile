import 'package:dio/dio.dart';

import '../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenStorage storage;

  bool _isRefreshing = false;
  final List<Function(String)> _queue = [];

  AuthInterceptor({required this.dio, required this.storage});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(_withFriendlyMessage(err));
    }

    final refreshToken = await storage.getRefresh();
    if (refreshToken == null) {
      return handler.next(_withFriendlyMessage(err));
    }

    if (_isRefreshing) {
      _queue.add((newToken) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        dio
            .fetch(err.requestOptions)
            .then(
              (r) => handler.resolve(r),
              onError: (e) => handler.reject(_withFriendlyMessage(e)),
            );
      });
      return;
    }

    if (err.requestOptions.path == '/auth/refresh') {
      return handler.next(_withFriendlyMessage(err));
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
      handler.next(_withFriendlyMessage(err));
    } finally {
      _isRefreshing = false;
    }
  }

  DioException _withFriendlyMessage(DioException err) {
    String message = 'Une erreur est survenue, veuillez réessayer.';
    final data = err.response?.data;

    if (data is Map) {
      final apiMessage = data['message'] ?? data['error'] ?? data['detail'];
      if (apiMessage != null && apiMessage.toString().isNotEmpty) {
        message = apiMessage.toString();
      } else if (err.response?.statusCode == 403) {
        message = 'Email ou mot de passe incorrect.';
      }
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      message = 'La connexion a expiré, vérifiez votre réseau.';
    } else if (err.type == DioExceptionType.connectionError) {
      message = 'Impossible de se connecter au serveur.';
    } else if (err.response?.statusCode == 403) {
      message = 'Email ou mot de passe incorrect.';
    } else if (err.response?.statusCode == 401) {
      message = 'Session expirée, veuillez vous reconnecter.';
    }

    return err.copyWith(error: message);
  }

  Future<Map<String, String>> _refresh(String refreshToken) async {
    final response = await dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    return {
      'access': response.data['accessToken'],
      'refresh': response.data['refreshToken'],
    };
  }
}
