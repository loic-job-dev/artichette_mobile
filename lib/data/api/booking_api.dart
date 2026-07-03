import 'package:dio/dio.dart';

import '../dto/booking_create_request.dart';

class BookingApi {
  final Dio dio;

  BookingApi(this.dio);

  Future<dynamic> createBooking(
      BookingCreateRequest request,
      ) async {
    final response = await dio.post(
      '/bookings',
      data: request.toJson(),
    );

    return response.data;
  }
}