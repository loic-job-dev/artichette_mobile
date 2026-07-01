import 'package:artichette/theme/app_color.dart';
import 'package:artichette/theme/app_radius.dart';
import 'package:artichette/widgets/carousel_room.dart';
import 'package:flutter/material.dart';
import '../models/room_type.dart';
import 'filled_button.dart';

class RoomPreviewCard extends StatelessWidget {
  const RoomPreviewCard({
    super.key,
    required this.roomType,
    required this.onBook,
    required this.onDetails,
  });

  final RoomType roomType;
  final VoidCallback onBook;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAvailable = roomType.availability;

    return Card(
      child: InkWell(
        onTap: onDetails,
        borderRadius: AppRadius.medium,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      roomType.type,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!isAvailable) _AvailabilityBadge(),
                ],
              ),

              const SizedBox(height: 8),

              CarouselRoom(pictureList: roomType.pictures),

              const SizedBox(height: 8),

              // DESCRIPTION
              Text(
                roomType.description,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              // PRICE + ACTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomType.priceDisplay,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  AppFilledButton(
                    onPressed: isAvailable ? onBook : null,
                    compact: true,
                    child: const Text("Réserver"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Indisponible",
        style: const TextStyle(
          color: AppColors.textLight,
          fontSize: 12,
        ),
      ),
    );
  }
}