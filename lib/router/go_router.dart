import 'package:artichette/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/main_scaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        int currentIndex;

        switch (state.uri.path) {
          case '/login':
            currentIndex = 1;
            break;

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

        // GoRoute(
        //   path: '/booking',
        //   builder: (context, state) => const BookingScreen(),
        // ),
        //
        GoRoute(
           path: '/me',
           builder: (context, state) => const ProfileScreen(),
         ),
      ],
    ),
  ],
);