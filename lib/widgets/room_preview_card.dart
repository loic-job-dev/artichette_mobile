import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/theme/app_color.dart';
import 'package:artichette/theme/app_radius.dart';
import 'package:artichette/widgets/carousel_room.dart';
import 'package:artichette/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import '../domain/models/room_type.dart';
import 'filled_button.dart';

class RoomPreviewCard extends StatelessWidget {
  const RoomPreviewCard({
    super.key,
    required this.roomType,
    required this.onBook,
    required this.onDetails,
  });

  final RoomType roomType;
  final void Function(RoomType room) onBook;
  final void Function(RoomType room) onDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAvailable = roomType.availability;
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: InkWell(
        //onTap: onDetails,
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
                      roomType.description,
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

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomType.details,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    roomType.priceToFixDisplay,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppOutlinedButton(
                    onPressed: () => onDetails(roomType),
                    compact: true,
                    child: Text(l10n.roomPreviewCard_details),
                  ),
                  AppFilledButton(
                    onPressed: isAvailable ? () => onBook(roomType) : null,
                    compact: true,
                    child: Text(l10n.roomPreviewCard_bookingBtn),
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
        style: const TextStyle(color: AppColors.textLight, fontSize: 12),
      ),
    );
  }
}
