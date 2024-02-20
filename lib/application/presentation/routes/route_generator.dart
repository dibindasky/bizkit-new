import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
 static final router = GoRouter(
  // Specify initial location (use your preferred route from Routes.dart)
  initialLocation: Routes.initial,
  routes: [
    GoRoute(
      path: Routes.initial,
      builder: (context, state) =>const SplashScreen(),
    ),
    GoRoute(
      path: Routes.loginInPage,
      builder: (context, state) => const LoGInScreen(),
    ),
    GoRoute(
      path: Routes.cardCreation,
      builder: (context, state) => const StartingBusinessCardCreation(),
    ),
  ],
  errorBuilder: (context, state) => _errorScreen(),
);

  static  _errorScreen() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Error while navigating')),
      );
    });
  }
}
