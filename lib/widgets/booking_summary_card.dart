import 'package:artichette/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/models/booking.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({
    super.key,
    required this.booking,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final startDate = DateFormat('dd-MM-yyyy').format(booking.startBookedDate);
    final endDate = DateFormat('dd-MM-yyyy').format(booking.endBookedDate);

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
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/pictures/rooms/DLX2.png',
                        fit: BoxFit.cover,
                      ),
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
                        "Réservation n° ${booking.id}",
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                                booking.roomTypes.first.description,
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                l10n.bookingSummaryCard_nbNight(booking.numberOfNights),
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          Text(
                            booking.roomUnitPriceDisplay,
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
                                    startDate,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(l10n.bookingSummaryCard_leaving),
                                  Text(
                                    endDate,
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
                                'Total à payer',
                                style: theme.textTheme.labelLarge,
                              ),
                              Text(
                                booking.totalStayPriceWithoutOptionsDisplay,
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     AppOutlinedButton(
                          //       onPressed: () {
                          //         // TODO : create navigation between screens
                          //       },
                          //       compact: false,
                          //       child: Text(l10n.bookingSummaryCard_calendar),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     AppFilledButton(
                    //       onPressed: () {
                    //         // TODO : create navigation between screens
                    //       },
                    //       compact: false,
                    //       child: Text(l10n.bookingSummaryCard_home),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     AppOutlinedButton(
                    //       onPressed: () {
                    //         // TODO : create navigation between screens
                    //       },
                    //       compact: false,
                    //       child: Text(l10n.bookingSummaryCard_myBookings),
                    //     ),
                    //   ],
                    // ),

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
