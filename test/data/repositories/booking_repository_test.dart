import 'package:artichette/data/api/booking_api.dart';
import 'package:artichette/data/dto/booking_create_request.dart';
import 'package:artichette/data/repositories/booking_repository.dart';
import 'package:artichette/domain/models/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockBookingApi extends Mock implements BookingApi {}


class FakeBookingCreateRequest extends Fake
    implements BookingCreateRequest {}


Client fakeClient() {
  return const Client(
    firstName: 'Jean',
    lastName: 'Dupont',
    phoneNumber: '0600000000',
    addresses: {},
  );
}


void main() {

  late MockBookingApi api;
  late BookingRepository repository;


  setUpAll(() {
    registerFallbackValue(
      FakeBookingCreateRequest(),
    );
  });


  setUp(() {
    api = MockBookingApi();
    repository = BookingRepository(api);
  });



  test('creates booking and sends correct request', () async {

    when(() => api.createBooking(any()))
        .thenAnswer((_) async => {

      "id": "1",
      "validationDate": "2026-01-01",
      "startBookedDate": "2026-01-10",
      "endBookedDate": "2026-01-12",
      "adultNumber": 2,
      "childrenNumber": 1,
      "roomUnitPrice": 10000,
      "status": "confirmed",

      "user": {
        "firstName": "Jean",
        "lastName": "Dupont",
        "phoneNumber": "0600000000",
        "addresses": []
      },

      "roomTypes": []
    });



    final result = await repository.createBooking(
      startDate: DateTime(2026, 1, 10),
      endDate: DateTime(2026, 1, 12),
      adults: 2,
      children: 1,
      roomType: 'STD',
    );



    final captured = verify(
          () => api.createBooking(
        captureAny(),
      ),
    ).captured.first as BookingCreateRequest;



    expect(
      captured.startBookedDate,
      DateTime(2026, 1, 10),
    );

    expect(
      captured.endBookedDate,
      DateTime(2026, 1, 12),
    );

    expect(
      captured.adultNumber,
      2,
    );

    expect(
      captured.childrenNumber,
      1,
    );

    expect(
      captured.roomType,
      'STD',
    );


    expect(
      result.id,
      '1',
    );

    expect(
      result.status,
      'confirmed',
    );
  });



  test('propagates api exceptions', () async {

    when(() => api.createBooking(any()))
        .thenThrow(Exception('API failed'));



    expect(
          () => repository.createBooking(
        startDate: DateTime(2026,1,10),
        endDate: DateTime(2026,1,12),
        adults: 2,
        roomType: 'STD',
      ),
      throwsException,
    );

  });

}