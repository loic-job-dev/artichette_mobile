import 'package:artichette/data/repositories/booking_repository.dart';
import 'package:flutter/material.dart';

import '../data/repositories/room_repository.dart';
import '../domain/models/booking.dart';
import '../domain/models/room_type.dart';

class BookingViewModel extends ChangeNotifier {
  BookingViewModel(
      this.roomRepository,
      this.bookingRepository
      );

  final RoomsRepository roomRepository;
  final BookingRepository bookingRepository;

  DateTimeRange? range;
  int? adults;
  int? children;

  List<RoomType> rooms = [];
  RoomType? selectedRoom;
  Booking? currentBooking;

  bool loading = false;
  String? errorMessage;

  Future<void> searchRooms({
    required DateTime start,
    required DateTime end,
    required int adults,
    int children = 0,
  }) async {
    range = DateTimeRange(
      start: start,
      end: end,
    );

    this.adults = adults;
    this.children = children;

    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      rooms = await roomRepository.getAvailability(
        startDate: start,
        endDate: end,
      );
    } catch (e) {
      errorMessage = e.toString();
      rooms = [];
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void selectRoom(RoomType room) {
    selectedRoom = room;
    notifyListeners();
  }

  Future<void> createBooking(RoomType room) async {
    if (range == null || adults == null) {
      debugPrint("ERREUR : range ou adults null");
      errorMessage = "Informations manquantes";
      notifyListeners();
      return;
    }

    debugPrint("AVANT API");

    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final booking = await bookingRepository.createBooking(
        startDate: range!.start,
        endDate: range!.end,
        adults: adults!,
        children: children,
        roomType: room.type,
      );

      debugPrint("RETOUR API : ${booking.id}");

      currentBooking = booking;

      debugPrint("CURRENT BOOKING : ${currentBooking?.id}");

      range = null;
      adults = null;
      children = null;
      rooms = [];

    } catch (e) {
      debugPrint("ERREUR CREATE BOOKING : $e");
      errorMessage = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}