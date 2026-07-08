import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/user.dart';
import '../view_models/booking_view_model.dart';
import '../view_models/user_view_model.dart';
import '../widgets/room_preview_card.dart';
import '../widgets/stay_search_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingVM = context.watch<BookingViewModel>();
    final user = context.select<UserViewModel, User?>(
          (vm) => vm.user,
    );

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
            const SizedBox(height: 20),
            ...bookingVM.rooms.map(
                  (room) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RoomPreviewCard(
                  roomType: room,
                  onBook: (room) async {
                    if (user != null) {
                      await bookingVM.createBooking(room);
                      if (bookingVM.currentBooking != null && context.mounted) {
                        context.go(
                          '/booking-summary',
                          extra: bookingVM.currentBooking,
                        );
                      }
                    } else {
                      context.go('/login');
                    }
                  },
                  onDetails: (room) {
                    context.go(
                      '/roomdetails',
                      extra: room,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}