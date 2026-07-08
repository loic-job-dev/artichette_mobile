import 'package:artichette/data/api/user_api.dart';
import 'package:artichette/domain/models/user.dart';

class UserRepository {
  final UserApi api;

  UserRepository(this.api);

  Future<User> getMe() async {
    final data = await api.getMe();
    return User.fromJsonUserResponse(data);
  }

  Future<User> updateMe({
    required User user,
    required String password,
  }) async {
    final data = await api.updateMe(user.toUpdateRequest(password: password));
    return User.fromJsonUserResponse(data);
  }
}
