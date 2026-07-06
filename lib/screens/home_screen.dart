import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/booking_view_model.dart';
import '../widgets/room_preview_card.dart';
import '../widgets/stay_search_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingVM = context.watch<BookingViewModel>();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Hôtel"),
      // ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StaySearchCard(
            onSearch: (start, end, adults, children) {
              bookingVM.searchRooms(
                start: start,
                end: end,
                adults: adults,
                children: children,
              );
            },
          ),

          const SizedBox(height: 16),

          if (bookingVM.loading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            ...bookingVM.rooms.map(
                  (room) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RoomPreviewCard(
                  roomType: room,
                  onBook: (room) {
                    bookingVM.createBooking(room);
                  },
                  onDetails: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}