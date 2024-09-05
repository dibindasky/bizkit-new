import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PageRouteBuilder cardFadePageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      var opacityAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: opacityAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
  );
}

// Reusable FadeTransitionPage widget
class FadeTransitionPage extends CustomTransitionPage {
  FadeTransitionPage({
    required Widget child,
    LocalKey? key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) : super(
          key: key,
          child: child,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            final tween = Tween<double>(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            final opacityAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
        );
}
