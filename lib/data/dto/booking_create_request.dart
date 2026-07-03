import 'package:intl/intl.dart';

class BookingCreateRequest {
  static final DateFormat _formatter = DateFormat('yyyy-MM-dd');

  final DateTime startBookedDate;
  final DateTime endBookedDate;
  final int adultNumber;
  final int? childrenNumber;
  final String roomType;

  BookingCreateRequest({
    required this.startBookedDate,
    required this.endBookedDate,
    required this.adultNumber,
    this.childrenNumber,
    required this.roomType,
  });

  Map<String, dynamic> toJson() {
    return {
      'startBookedDate': _formatter.format(startBookedDate),
      'endBookedDate': _formatter.format(endBookedDate),
      'adultNumber': adultNumber,
      'childrenNumber': childrenNumber,
      'roomType': roomType,
    };
  }
}