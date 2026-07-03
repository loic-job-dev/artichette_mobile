import 'package:dio/dio.dart';

class RoomsApi {
  final Dio dio;

  RoomsApi(this.dio);

  Future<List<dynamic>> getAvailability({
    required String startDate,
    required String endDate,
  }) async {
    final response = await dio.get(
      '/roomtypes/availability',
      queryParameters: {
        'startDate': startDate,
        'endDate': endDate,
      },
    );

    return response.data;
  }
}