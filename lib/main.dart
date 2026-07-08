import 'package:artichette/data/api/booking_api.dart';
import 'package:artichette/data/api/room_api.dart';
import 'package:artichette/data/api/user_api.dart';
import 'package:artichette/data/repositories/booking_repository.dart';
import 'package:artichette/data/repositories/room_repository.dart';
import 'package:artichette/data/repositories/user_repository.dart';
import 'package:artichette/l10n/app_localizations.dart';
import 'package:artichette/router/go_router.dart';
import 'package:artichette/theme/app_theme.dart';
import 'package:artichette/view_models/booking_view_model.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:auth_artichette/auth_artichette.dart';
import 'package:provider/provider.dart';
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
  final userRepository = UserRepository(UserApi(dio));

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

        Provider<UserRepository>.value(value: userRepository),

        ChangeNotifierProvider(
          create: (_) => BookingViewModel(roomsRepository, bookingRepository),
        ),

        ChangeNotifierProvider(
          create: (_) => UserViewModel(userRepository)),
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

      supportedLocales: AppLocalizations.supportedLocales,

      localizationsDelegates: AppLocalizations.localizationsDelegates,

      title: "Artich'hôtel",
      theme: AppTheme.light,
    );
  }
}

