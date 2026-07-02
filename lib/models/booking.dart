import 'package:artichette/models/reservation_option.dart';
import 'package:artichette/models/room.dart';
import 'package:artichette/models/room_type.dart';

import 'client.dart';

class Booking {
  final String id;

  final DateTime validationDate;
  final DateTime startBookedDate;
  final DateTime endBookedDate;

  final DateTime? dateCheckin;
  final DateTime? dateCheckout;

  final int adultNumber;
  final int? childrenNumber;

  final int roomUnitPrice;

  final String status;

  final Client user;

  final List<Room>? rooms;
  final Set<RoomType> roomTypes;
  final List<ReservationOption>? options;

  const Booking({
    required this.id,
    required this.validationDate,
    required this.startBookedDate,
    required this.endBookedDate,
    this.dateCheckin,
    this.dateCheckout,
    required this.adultNumber,
    this.childrenNumber,
    required this.roomUnitPrice,
    required this.status,
    required this.user,
    this.rooms,
    required this.roomTypes,
    this.options,
  });

  String get roomUnitPriceDisplay =>
      "${(roomUnitPrice / 100).toStringAsFixed(2)} €";

  int get roomCount =>
      rooms?.length ?? roomTypes.length;

  int get roomTypeCount =>
      roomTypes.length;

  int get travellerCount =>
      adultNumber + (childrenNumber ?? 0);

  int get numberOfNights =>
      endBookedDate
          .difference(startBookedDate)
          .inDays;

  String get totalStayPriceWithoutOptionsDisplay =>
      "${((roomUnitPrice * numberOfNights)/100).toStringAsFixed(2)} €";
}