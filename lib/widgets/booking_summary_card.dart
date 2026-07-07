import 'package:artichette/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:artichette/widgets/outlined_button.dart';
import 'package:artichette/widgets/filled_button.dart';
import 'package:artichette/data/mocks/booking_mock.dart';

import '../domain/models/booking.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({
    super.key,
    required this.booking,
    required this.onConfirm,
  });

  final Booking booking;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mockBooking = BookingMock.getMockBooking();
    final startBookedDate = DateFormat(
      'dd-MM-yyyy',
    ).format(mockBooking.startBookedDate);
    final endBookedDate = DateFormat(
      'dd-MM-yyyy',
    ).format(mockBooking.endBookedDate);
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/checkmark.png', width: 60, height: 60),
              Text(
                l10n.bookingSummaryCard_confirmation,
                style: theme.textTheme.titleLarge,
              ),
              Text(
                l10n.bookingSummaryCard_description,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/pictures/rooms/DLX2.png',
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5A8A6B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Réservation n° ${mockBooking.id}",
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 215),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.outline,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mockBooking.roomTypes.first.type,
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "${mockBooking.numberOfNights} ${l10n.bookingSummaryCard_nbNight(mockBooking.numberOfNights)}",
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          Text(
                            "450€ / ${l10n.bookingSummaryCard_night}",
                            style: theme.textTheme.bodySmall,
                          ),
                          Divider(
                            color: theme.colorScheme.outline,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.bookingSummaryCard_arrival),
                                  Text(
                                    startBookedDate.toString(),
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(l10n.bookingSummaryCard_leaving),
                                  Text(
                                    endBookedDate.toString(),
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: theme.colorScheme.outline,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total payé',
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                mockBooking.totalStayPriceWithoutOptionsDisplay,
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppOutlinedButton(
                                onPressed: () {
                                  // TODO : create navigation between screens
                                },
                                compact: false,
                                child: Text(l10n.bookingSummaryCard_calendar),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppFilledButton(
                          onPressed: () {
                            // TODO : create navigation between screens
                          },
                          compact: false,
                          child: Text(l10n.bookingSummaryCard_home),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppOutlinedButton(
                          onPressed: () {
                            // TODO : create navigation between screens
                          },
                          compact: false,
                          child: Text(l10n.bookingSummaryCard_myBookings),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.labelLarge),
              Text(value, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
