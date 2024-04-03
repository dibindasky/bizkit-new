import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/data/firebase_api/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => context.read<AuthBloc>().add(const AuthEvent.log()));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        _navigateToSignInPage(context, state.isLogin, state.onBoardSkipBool);
      },
      child: Scaffold(
        body: FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 800),
          child: Center(
            child: Image.asset('asset/images/Bizkit.png'),
          ),
        ),
      ),
    );
  }

  void _navigateToSignInPage(
      BuildContext context, bool toLogin, bool isOnbaordSkip) async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (toLogin && isOnbaordSkip) {
        GoRouter.of(context).pushReplacementNamed(Routes.homePage);
      } else if (isOnbaordSkip && !toLogin) {
        GoRouter.of(context).pushReplacementNamed(Routes.loginPage);
      } else if (!isOnbaordSkip) {
        GoRouter.of(context).pushReplacementNamed(Routes.onBoarding);
      }
      //GoRouter.of(context).pushReplacementNamed(Routes.onBoarding);
      // GoRouter.of(context)
      //     .pushReplacementNamed(!toLogin ? Routes.loginPage : Routes.homePage);
    });
  }
}
