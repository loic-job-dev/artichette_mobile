import 'package:artichette/widgets/booking_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/room_type.dart';

import '../domain/models/booking.dart';
import '../domain/models/client.dart';

import '../view_models/booking_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookingViewModel>();
    Booking mockBooking() {
      return Booking(
        id: "1",
        validationDate: DateTime.now(),
        startBookedDate: DateTime.now(),
        endBookedDate: DateTime.now().add(const Duration(days:3)),
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
          RoomType(id: "1", type: "STD", description: "description", availability: true, price: 450, pictures: ["pictures"])
        }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hôtel"),
      ),
      body: BookingSummaryCard(booking: mockBooking(), onConfirm: () => print("Congrats")),
      // ListView(
      //   padding: const EdgeInsets.all(16),
      //   children: [
      //     LoginForm(),
      //     StaySearchCard(
      //       onSearch: (start, end, adults, children) {
      //         vm.searchRooms(
      //           start: start,
      //           end: end,
      //           adults: adults,
      //           children: children,
      //         );
      //       },
      //     ),

      //     const SizedBox(height: 16),

      //     if (vm.loading)
      //       const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     else
      //       ...vm.rooms.map(
      //             (room) => Padding(
      //           padding: const EdgeInsets.only(bottom: 16),
      //           child: RoomPreviewCard(
      //             roomType: room,
      //             onBook: (room) {
      //               vm.createBooking(room);
      //             },
      //             onDetails: () {},
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}