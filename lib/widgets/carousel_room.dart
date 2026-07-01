import 'package:artichette/theme/app_radius.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselRoom extends StatelessWidget {
  const CarouselRoom({
    super.key,
    required this.pictureList,
  });

  final List<String>? pictureList;

  @override
  Widget build(BuildContext context) {
    final pictures = pictureList;

    final screenWidth = MediaQuery.of(context).size.width;
    final height = screenWidth * 0.55;

    if (pictures == null || pictures.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: pictures.map((path) {
        return ClipRRect(
          borderRadius: AppRadius.small,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}