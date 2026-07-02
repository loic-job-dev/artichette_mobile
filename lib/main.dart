import 'package:artichette/screens/test_booking_summary_screen.dart';
import 'package:artichette/theme/app_theme.dart';
import 'package:artichette/widgets/filled_button.dart';
import 'package:artichette/widgets/login_form.dart';
import 'package:artichette/widgets/outlined_button.dart';
import 'package:artichette/widgets/room_preview_card.dart';
import 'package:artichette/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/room_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('fr', 'FR'),
      supportedLocales: const [
        Locale('fr', 'FR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Artich\'hôtel',
      theme: AppTheme.light,
      //home: const MyHomePage(title: 'Accueil de l\'hôtel Artichaut'),
      home: const TestBookingSummaryPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final RoomType roomTypeTest;
  late final RoomType roomTypeTestFull;

  @override
  void initState() {
    super.initState();

    final roomTypeTestPictures = [
      "assets/pictures/rooms/DLX2.png",
      "assets/pictures/rooms/DLX3.png",
      "assets/pictures/rooms/DLX4.png",
    ];

    final roomTypeTestFullPictures = [
      "assets/pictures/rooms/STE2.png",
      "assets/pictures/rooms/STE3.png",
      "assets/pictures/rooms/STE4.png",
    ];

    roomTypeTest = RoomType(
      type: 'Suite',
      description: 'C\'est la grande classe !',
      availability: true,
      price: 25000,
      pictures: roomTypeTestPictures,
    );

    roomTypeTestFull = RoomType(
      type: 'Chambre luxe',
      description: 'Dommage y\'en a plus !',
      availability: false,
      price: 19000,
      pictures: roomTypeTestFullPictures,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
          children: [
            Text(
              "Bienvenue",
              style: Theme.of(context).textTheme.displayLarge,
            ),

            const SizedBox(height: 32),

            LoginForm(),

            const SizedBox(height: 32),

            SignupForm(),

            const SizedBox(height: 32),

            RoomPreviewCard(roomType: roomTypeTest, onBook: () {  }, onDetails: () {  },),

            const SizedBox(height: 32),

            RoomPreviewCard(roomType: roomTypeTestFull, onBook: () {  }, onDetails: () {  },),
          ],
        ),
    );
  }
}
