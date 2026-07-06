import 'package:artichette/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/booking_view_model.dart';
import '../widgets/room_preview_card.dart';
import '../widgets/stay_search_card.dart';
import '../screens/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hôtel"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AuthScreen(),
         
        ],
      ),
    );
  }
}