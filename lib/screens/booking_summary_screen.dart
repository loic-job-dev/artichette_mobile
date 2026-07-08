import 'package:flutter/material.dart';

import '../domain/models/booking.dart';
import '../widgets/booking_summary_card.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({
    super.key,
    required this.booking,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation de réservation'),
      ),
      body: SafeArea(
        child: BookingSummaryCard(
          booking: booking,
        ),
      ),
    );
  }
}