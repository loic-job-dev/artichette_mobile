import 'package:artichette/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/booking.dart';
import '../domain/models/room_type.dart';
import '../screens/auth_screen.dart';
import '../screens/booking_summary_screen.dart';
import '../screens/home_screen.dart';
import '../screens/main_scaffold.dart';
import '../screens/room_detail_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        int currentIndex;

        switch (state.uri.path) {
          case '/login':
          case '/me':
            currentIndex = 1;
            break;

          case '/':
            currentIndex = 0;

          default:
            currentIndex = 0;
        }

        return MainScaffold(
          currentIndex: currentIndex,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),

         GoRoute(
           path: '/login',
           builder: (context, state) => const AuthScreen(),
         ),

        GoRoute(
          path: '/roomdetails',
          builder: (context, state) {
            final room = state.extra as RoomType;

            return RoomDetailScreen(
              room: room,
            );
          },
        ),

        GoRoute(
          path: '/booking-summary',
          builder: (context, state) {
            final booking = state.extra as Booking;

            return BookingSummaryScreen(
              booking: booking,
            );
          },
        ),

        GoRoute(
           path: '/me',
           builder: (context, state) => const ProfileScreen(),
         ),
      ],
    ),
  ],
);