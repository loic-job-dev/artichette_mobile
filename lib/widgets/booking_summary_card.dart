import 'package:flutter/material.dart';

import '../domain/models/booking.dart';
import '../theme/app_radius.dart';
import 'filled_button.dart';

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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Récapitulatif de votre réservation",
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _InfoRow(
              icon: Icons.calendar_month,
              title: "Séjour",
              value:
              "${booking.startBookedDate.day}/${booking.startBookedDate.month}/${booking.startBookedDate.year}"
                  " → "
                  "${booking.endBookedDate.day}/${booking.endBookedDate.month}/${booking.endBookedDate.year}",
            ),

            const Divider(),

            _InfoRow(
              icon: Icons.people,
              title: "Voyageurs",
              value:
              "${booking.adultNumber} adulte(s)"
                  "${booking.childrenNumber != null && booking.childrenNumber! > 0 ? " • ${booking.childrenNumber} enfant(s)" : ""}",
            ),

            const Divider(),

            _InfoRow(
              icon: Icons.hotel,
              title: "Type(s) de chambre",
              value: booking.roomTypes
                  .map((room) => room.type)
                  .join(", "),
            ),


            if ((booking.options?.isNotEmpty ?? false)) ...[
              const Divider(),

              Row(
                children: [
                  const Icon(Icons.add_circle_outline),
                  const SizedBox(width: 8),
                  Text(
                    "Options",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ...?booking.options?.map(
                    (option) => Padding(
                  padding: const EdgeInsets.only(left: 32, bottom: 4),
                  child: Text("• ${option.optionName}"),
                ),
              ),
            ],

            const Divider(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix hors options",
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  booking.totalStayPriceWithoutOptionsDisplay,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                onPressed: onConfirm,
                compact: false,
                child: const Text("Procéder au paiement"),
              ),
            ),
          ],
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