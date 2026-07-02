import 'package:flutter/material.dart';

import '../domain/models/booking.dart';
import '../domain/models/address.dart';
import '../domain/models/client.dart';
import '../domain/models/reservation_option.dart';
import '../domain/models/room.dart';
import '../domain/models/room_type.dart';
import '../widgets/booking_summary_card.dart';
import '../widgets/stay_search_card.dart';

class TestBookingSummaryPage extends StatelessWidget {
  const TestBookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Booking(
      id: "8d9df81d-79f2-4b8b-bd2d-13d23ef47b77",
      validationDate: DateTime.now(),
      startBookedDate: DateTime(2026, 7, 15),
      endBookedDate: DateTime(2026, 7, 18),
      adultNumber: 2,
      roomUnitPrice: 12900,
      status: 'BOOKED',
      user: Client(
        firstName: "Jean",
        lastName: "Dupont",
        phoneNumber: "06 12 34 56 78",
        addresses: {
          Address(
            streetNumber: 12,
            streetType: "Rue",
            streetName: "des Lilas",
            addressComplement: "Appartement B",
            zipCode: "75012",
            city: "Paris",
          ),
        },
      ),
      roomTypes: {
        const RoomType(
          type: "Chambre Deluxe",
          description: "Grande chambre avec vue sur le jardin.",
          availability: true,
          price: 12900,
          pictures: [],
        ),
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Booking Summary"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StaySearchCard(
              onSearch: (start, end, travellers) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Recherche: $start → $end ($travellers pers.)",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            BookingSummaryCard(
              booking: booking,
              onConfirm: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Paiement à implémenter"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}