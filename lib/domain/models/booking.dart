import 'package:artichette/domain/models/room.dart';
import 'package:artichette/domain/models/reservation_option.dart';
import 'package:artichette/domain/models/room.dart';
import 'package:artichette/domain/models/room_type.dart';

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
      "${((roomUnitPrice * numberOfNights)).toStringAsFixed(2)} €";

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      validationDate: DateTime.parse(json['validationDate']),
      startBookedDate: DateTime.parse(json['startBookedDate']),
      endBookedDate: DateTime.parse(json['endBookedDate']),
      dateCheckin: json['dateCheckin'] != null
          ? DateTime.parse(json['dateCheckin'])
          : null,
      dateCheckout: json['dateCheckout'] != null
          ? DateTime.parse(json['dateCheckout'])
          : null,
      adultNumber: json['adultNumber'],
      childrenNumber: json['childrenNumber'],
      roomUnitPrice: json['roomUnitPrice'],
      status: json['status'],
      user: Client.fromJson(json['user']),
      rooms: (json['rooms'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(Room.fromJson)
          .toList(),
      roomTypes: (json['roomTypes'] as List)
          .map((e) => RoomType.fromJson(e))
          .toSet(),
      options: (json['options'] as List?)
          ?.whereType<Map<String, dynamic>>()
          .map(ReservationOption.fromJson)
          .toList(),
    );
  }
}