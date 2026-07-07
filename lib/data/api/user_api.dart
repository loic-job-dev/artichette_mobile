import 'package:artichette/data/dto/user_update_request.dart';
import 'package:dio/dio.dart';

class UserApi {
  final Dio dio;

  UserApi(this.dio);

  Future<dynamic> getMe() async {
    final response = await dio.get('/users/me');
    return response.data;
  }

  Future<dynamic> updateMe(UserUpdateRequest request) async {
    final response = await dio.put('/users/me', data: request.toJson());
    return response.data;
  }
}
