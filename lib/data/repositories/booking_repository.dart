import 'package:artichette/data/dto/booking_create_request.dart';
import 'package:artichette/domain/models/booking.dart';
import 'package:intl/intl.dart';
import '../api/booking_api.dart';

class BookingRepository {
  final BookingApi api;

  BookingRepository(this.api);


  Future<Booking> createBooking({
    required DateTime startDate,
    required DateTime endDate,
    required int adults,
    int? children,
    required String roomType,
  }) async {

    print('InRepoPrint');
    final request = BookingCreateRequest(
      startBookedDate: startDate,
      endBookedDate: endDate,
      adultNumber: adults,
      childrenNumber: children,
      roomType: roomType,
    );
        print('InRepoPrintPostRequest');
    final data = await api.createBooking(request);

    return Booking.fromJson(data);
  }
}