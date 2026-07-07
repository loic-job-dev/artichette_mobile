import 'package:artichette/domain/models/booking.dart';
import 'package:artichette/domain/models/client.dart';
import 'package:flutter_test/flutter_test.dart';


Client fakeClient() {
  return const Client(
    firstName: 'Jean',
    lastName: 'Dupont',
    phoneNumber: '0600000000',
    addresses: {},
  );
}


void main() {

  test('travellerCount calculates correctly', () {

    final booking = Booking(
      id:'1',
      validationDate:DateTime.now(),
      startBookedDate:DateTime(2026,1,1),
      endBookedDate:DateTime(2026,1,5),
      adultNumber:2,
      childrenNumber:2,
      roomUnitPrice:10000,
      status:'confirmed',
      user: fakeClient(),
      roomTypes:{},
    );


    expect(
      booking.travellerCount,
      4,
    );

  });


  test('numberOfNights calculates correctly', () {

    final booking = Booking(
      id:'1',
      validationDate:DateTime.now(),
      startBookedDate:DateTime(2026,1,1),
      endBookedDate:DateTime(2026,1,5),
      adultNumber:2,
      roomUnitPrice:10000,
      status:'confirmed',
      user: fakeClient(),
      roomTypes:{},
    );


    expect(
      booking.numberOfNights,
      4,
    );

  });

}