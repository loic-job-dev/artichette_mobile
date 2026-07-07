import 'package:artichette/data/api/booking_api.dart';
import 'package:artichette/data/api/room_api.dart';
import 'package:artichette/data/repositories/booking_repository.dart';
import 'package:artichette/data/repositories/room_repository.dart';
import 'package:artichette/router/go_router.dart';
import 'package:artichette/screens/home_screen.dart';
import 'package:artichette/theme/app_theme.dart';
import 'package:artichette/view_models/booking_view_model.dart';
import 'package:artichette/widgets/login_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import 'core/network/api_config.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenStorage = TokenStorage();

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      dio: dio,
      storage: tokenStorage,
    ),
  );

  final authRepository = AuthRepository(
    storage: tokenStorage,
    api: AuthApi(dio),
  );

  final roomsRepository = RoomsRepository(RoomsApi(dio));
  final bookingRepository = BookingRepository(BookingApi(dio));

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>.value(
          value: authRepository,
        ),

        Provider<RoomsRepository>.value(
          value: roomsRepository,
        ),

        Provider<BookingRepository>.value(
          value: bookingRepository,
        ),

        ChangeNotifierProvider(
          create: (_) => BookingViewModel(roomsRepository, bookingRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,

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

      title: "Artich'hôtel",
      theme: AppTheme.light,
    );
  }
}
