import 'package:auth_artichette/auth_artichette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/app_header.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),

          Expanded(
            child: child,
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) async {
          switch (index) {
            case 0:
              context.go('/');
              break;

            case 1:
              final authRepository = context.read<AuthRepository>();

              if (authRepository.isLoggedIn) {
                if (context.mounted) {
                  context.go('/me');
                }
              } else {
                if (context.mounted) {
                  context.go('/login');
                }
              }
              break;
          }
        },
      ),
    );
  }
}