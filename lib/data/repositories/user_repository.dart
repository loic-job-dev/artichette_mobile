import 'package:artichette/data/api/user_api.dart';
import 'package:artichette/domain/models/user.dart';

class UserRepository {
  final UserApi api;

  UserRepository(this.api);

  Future<User> getMe() async {
    final data = await api.getMe();
    return User.fromJson(data);
  }

  Future<User> updateMe({
    required User client,
    required String password,
  }) async {
    final data = await api.updateMe(client.toUpdateRequest(password: password));
    return User.fromJson(data);
  }
}
