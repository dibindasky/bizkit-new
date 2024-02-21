import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => context.read<AuthBloc>().add(const AuthEvent.log()));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        _navigateToSignInPage(context, state.isLogin);
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

  void _navigateToSignInPage(BuildContext context, bool toLogin) async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      context.go(!toLogin ? Routes.loginPage : Routes.cardCreation);
    });
  }
}
