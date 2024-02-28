import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/connections/card_view/my_connection_detail_first_half.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
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
      GoRoute(
        path: Routes.loginPage,
        builder: (context, state) => const LoGInScreen(),
      ),
      GoRoute(
        path: Routes.cardCreation,
        builder: (context, state) => const StartingBusinessCardCreation(),
      ),
      GoRoute(
        path: Routes.homePage,
        builder: (context, state) => const BizkitBottomNavigationBar(),
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
