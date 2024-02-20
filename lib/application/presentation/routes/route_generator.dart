import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_detail_first_half/my_connection_detail_first_half.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    routes: [
      GoRoute(
        path: Routes.initial,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '${Routes.cardView}/:cardId',
        builder: (context, state) {
          final cardId = int.tryParse(state.pathParameters['cardId'] ?? '');
          if (cardId != null) {
            return HomeFirstViewAllContactTileDetailView(cardId: cardId);
          } else {
            return _errorScreen();
          }
        },
      ),
    ],
    errorBuilder: (context, state) => _errorScreen(),
  );

  static _errorScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  }
}
