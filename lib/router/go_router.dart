import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    //TODO: uncomment GoRoute code and modify builder line depending on the class name for each screen
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: '/booking',
    //   builder: (context, state) => const BookingScreen(),
    // ),
    // GoRoute(
    //   path: '/roomdetails',
    //   builder: (context, state) => const RoomDetailsScreen(),
    // ),
    // GoRoute(
    //   path: '/me',
    //   builder: (context, state) => const ClientDetailsScreen(),
    // ),
  ],
);