import 'package:artichette/data/mocks/booking_mock.dart';
import 'package:artichette/screens/room_detail_screen.dart';
import 'package:artichette/widgets/booking_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/room_type.dart';
import 'package:artichette/data/mocks/roomtype_mock..dart';
import 'package:artichette/data/mocks/booking_mock.dart';

import '../domain/models/booking.dart';
import '../domain/models/client.dart';

import '../view_models/booking_view_model.dart';
import '../widgets/room_preview_card.dart';
import '../widgets/stay_search_card.dart';
import '../screens/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingVM = context.watch<BookingViewModel>();
    final booking = BookingMock.getMockBooking();
    final imageUrls = [
      "assets/pictures/rooms/STE2.png",
      "assets/pictures/rooms/STE3.png",
      "assets/pictures/rooms/STE4.png",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: RoomDetailScreen(
          booking: booking,
          imageUrls: imageUrls,
          onConfirm: () => print('coucou'),
        ),
      ),
    );
  }
}
