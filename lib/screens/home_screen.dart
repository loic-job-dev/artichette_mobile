import 'package:artichette/data/mocks/booking_mock.dart';
import 'package:artichette/widgets/booking_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/room_type.dart';
import 'package:artichette/data/mocks/roomtype_mock..dart';

import '../domain/models/booking.dart';
import '../domain/models/user.dart';

import '../view_models/booking_view_model.dart';
import '../widgets/room_preview_card.dart';
import '../widgets/stay_search_card.dart';
import '../screens/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingVM = context.watch<BookingViewModel>();

    return Scaffold(
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

      //     const SizedBox(height: 16),

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
                  //TODO : Add room details page
                  // onDetails: (room) {
                  //   context.go('/roomdetails');
                  // },
                ),
              ),
            ),
        ],
      ),
    );
  }
}