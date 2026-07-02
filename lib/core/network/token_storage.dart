import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();

  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  Future<void> save(String access, String refresh) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  Future<String?> getAccess() => _storage.read(key: _accessKey);
  Future<String?> getRefresh() => _storage.read(key: _refreshKey);

  Future<void> clear() async => _storage.deleteAll();
}