import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/booking.dart';
import 'package:artichette/domain/models/client.dart';
import 'package:artichette/domain/models/room_type.dart';

class BookingMock {
  static Booking getMockBooking() {
    return Booking(
      id: "1",
      validationDate: DateTime.now(),
      startBookedDate: DateTime.now(),
      endBookedDate: DateTime.now().add(const Duration(days: 3)),
      adultNumber: 2,
      roomUnitPrice: 70,
      status: 'available',
      user: Client(
        firstName: "Hey",
        lastName: "Joe",
        phoneNumber: "0606060606",
        addresses: {
          const Address(
            streetNumber: 1,
            streetType: "rue",
            streetName: "de la Paix",
            zipCode: "26000",
            city: "Valence",
          ),
        },
      ),
      roomTypes: {
        RoomType(
          id: "1",
          type: "STD",
          description: "Chambre standard avec vue sur le jardin",
          availability: true,
          price: 450,
          pictures: ["assets/pictures/rooms/STD1.png"],
        ),
      },
    );
  }
}