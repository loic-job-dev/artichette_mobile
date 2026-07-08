import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RoomsApi {
  final Dio dio;

  RoomsApi(this.dio);

  Future<List<dynamic>> getAvailability({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await dio.get(
        '/roomtypes/availability',
        queryParameters: {
          'startDate': startDate,
          'endDate': endDate,
        },
      );

      return response.data;
    } on DioException catch (e) {
      debugPrint("===== DIO =====");
      debugPrint("URI      : ${e.requestOptions.uri}");
      debugPrint("Type     : ${e.type}");
      debugPrint("Message  : ${e.message}");
      debugPrint("Error    : ${e.error}");
      debugPrint("Response : ${e.response?.statusCode}");
      debugPrint("Body     : ${e.response?.data}");
      rethrow;
    }
  }
}