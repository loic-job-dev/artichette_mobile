import 'package:artichette/data/repositories/booking_repository.dart';
import 'package:artichette/data/repositories/room_repository.dart';
import 'package:artichette/domain/models/booking.dart';
import 'package:artichette/domain/models/room_type.dart';
import 'package:artichette/view_models/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:artichette/domain/models/user.dart';

class MockRoomsRepository extends Mock implements RoomsRepository {}

class MockBookingRepository extends Mock implements BookingRepository {}

class FakeRoomType extends Fake implements RoomType {}

class FakeBooking extends Fake implements Booking {}

void main() {
  late MockRoomsRepository roomsRepository;
  late MockBookingRepository bookingRepository;
  late BookingViewModel viewModel;

  User fakeClient() {
    return const User(
      firstName: 'Jean',
      lastName: 'Dupont',
      phoneNumber: '0600000000',
      email: 'fake@mail.com',
      addresses: {},
    );
  }

  setUp(() {
    roomsRepository = MockRoomsRepository();
    bookingRepository = MockBookingRepository();

    viewModel = BookingViewModel(
      roomsRepository,
      bookingRepository,
    );

    registerFallbackValue(FakeRoomType());
    registerFallbackValue(FakeBooking());
  });


  test('searchRooms loads rooms successfully', () async {
    final rooms = [
      RoomType(
        id: '1',
        type: 'STD',
        description: 'Standard',
        availability: true,
        price: 10000,
        pictures: [],
        details: 'King size',
      ),
    ];

    when(() => roomsRepository.getAvailability(
      startDate: any(named: 'startDate'),
      endDate: any(named: 'endDate'),
    )).thenAnswer((_) async => rooms);


    await viewModel.searchRooms(
      start: DateTime(2026, 1, 1),
      end: DateTime(2026, 1, 5),
      adults: 2,
      children: 1,
    );


    expect(viewModel.rooms, rooms);
    expect(viewModel.loading, false);
    expect(viewModel.errorMessage, null);
    expect(viewModel.adults, 2);
    expect(viewModel.children, 1);
  });


  test('searchRooms handles repository error', () async {
    when(() => roomsRepository.getAvailability(
      startDate: any(named: 'startDate'),
      endDate: any(named: 'endDate'),
    )).thenThrow(Exception('API error'));


    await viewModel.searchRooms(
      start: DateTime(2026, 1, 1),
      end: DateTime(2026, 1, 5),
      adults: 2,
    );


    expect(viewModel.loading, false);
    expect(viewModel.rooms, isEmpty);
    expect(viewModel.errorMessage, contains('API error'));
  });


  test('selectRoom updates selectedRoom', () {
    final room = RoomType(
      id: '1',
      type: 'STD',
      description: '',
      availability: true,
      price: 100,
      pictures: [],
      details: '',
    );


    viewModel.selectRoom(room);


    expect(viewModel.selectedRoom, room);
  });


  test('createBooking creates booking successfully', () async {
    final booking = Booking(
      id: '1',
      validationDate: DateTime(2026, 1, 1),
      startBookedDate: DateTime(2026, 1, 10),
      endBookedDate: DateTime(2026, 1, 12),
      adultNumber: 2,
      roomUnitPrice: 10000,
      status: 'confirmed',
      user: fakeClient(),
      roomTypes: {},
    );


    final room = RoomType(
      id: '1',
      type: 'STD',
      description: '',
      availability: true,
      price: 100,
      pictures: [],
      details: '',
    );


    viewModel.range = DateTimeRange(
      start: DateTime(2026, 1, 10),
      end: DateTime(2026, 1, 12),
    );

    viewModel.adults = 2;


    when(() => bookingRepository.createBooking(
      startDate: any(named: 'startDate'),
      endDate: any(named: 'endDate'),
      adults: any(named: 'adults'),
      children: any(named: 'children'),
      roomType: any(named: 'roomType'),
    )).thenAnswer((_) async => booking);


    await viewModel.createBooking(room);


    expect(viewModel.currentBooking, booking);
    expect(viewModel.loading, false);
    expect(viewModel.range, null);
    expect(viewModel.adults, null);
    expect(viewModel.rooms, isEmpty);
  });


  test('createBooking refuses missing information', () async {
    final room = RoomType(
      id: '1',
      type: 'STD',
      description: '',
      availability: true,
      price: 100,
      pictures: [],
      details: '',
    );


    await viewModel.createBooking(room);


    verifyNever(() => bookingRepository.createBooking(
      startDate: any(named: 'startDate'),
      endDate: any(named: 'endDate'),
      adults: any(named: 'adults'),
      children: any(named: 'children'),
      roomType: any(named: 'roomType'),
    ));


    expect(
      viewModel.errorMessage,
      'Informations manquantes',
    );
  });
}