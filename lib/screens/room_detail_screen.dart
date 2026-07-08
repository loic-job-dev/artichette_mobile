import 'package:artichette/widgets/feature_chip.dart';
import 'package:flutter/material.dart';
import '../domain/models/booking.dart';

class RoomDetailScreen extends StatefulWidget {
  final Booking booking;
  final VoidCallback onConfirm;
  final List<String> imageUrls;

  const RoomDetailScreen({
    super.key,
    required this.booking,
    required this.onConfirm,
    required this.imageUrls,
  });

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            const Text("Détail de la chambre"),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    PageView.builder(
                      controller: _controller,
                      itemCount: widget.imageUrls.length,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.imageUrls[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                child: const Icon(
                                  Icons.image_not_supported_outlined,
                                ),
                              ),
                        );
                      },
                    ),
                    Positioned(
                      left: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        color: Colors.black54,
                        child: Text(
                          '${_currentIndex + 1}/${widget.imageUrls.length}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Suite canopée',
                        style: theme.textTheme.displayMedium,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text('Avis sur la chambre'),
                        ],
                      ),
                    ],
                  ),
                  FilledButton(
                    onPressed: () => (),
                    child: const Text('Disponibilite'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureChip(label: "45 m²", icon: Icons.square),
                  FeatureChip(
                    label: widget.booking.roomTypes.first.details,
                    icon: Icons.bed,
                  ),
                  FeatureChip(label: "Vue forêt", icon: Icons.forest),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: theme.textTheme.displayMedium),
                    Text(
                      widget.booking.roomTypes.first.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Equipements'),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wifi),
                            const SizedBox(width: 8),
                            Text("Wi-fi haut débit"),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.ac_unit),
                            const SizedBox(width: 8),
                            Text("Climatisation"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.coffee_maker),
                            const SizedBox(width: 8),
                            Text("Machine à café"),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.table_bar),
                            const SizedBox(width: 8),
                            Text("Terrasse privée"),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: theme.colorScheme.outline, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Prix par nuit"),
                            Text(
                              widget.booking.roomTypes.first.price.toString(),
                            ),
                          ],
                        ),
                        FilledButton(
                          onPressed: () => (),
                          child: Text("Réserver maintenant"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
