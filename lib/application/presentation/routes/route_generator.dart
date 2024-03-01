import 'dart:convert';

import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/otp_screen.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/connections/card_view/my_connection_detail_first_half.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/profile_creation/profile_creation.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    routes: [
      GoRoute(
        name: Routes.initial,
        path: Routes.initial,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.cardView,
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
        name: Routes.loginPage,
        path: Routes.loginPage,
        builder: (context, state) => const LoGInScreen(),
      ),
      GoRoute(
        name: Routes.cardCreationProfilePage,
        path: Routes.cardCreationProfilePage,
        builder: (context, state) => const ProfileCreationScreen(),
      ),
      GoRoute(
        name: Routes.signUpPage,
        path: Routes.signUpPage,
        builder: (context, state) => const SignInscreeen(),
      ),
// otp page
      GoRoute(
        name: Routes.otpPage,
        path: '${Routes.otpPage}/:email/:fromBusiness/:model',
        builder: (context, state) {
          print(state.pathParameters);
          SignUpModel? businessModel;
          SignUpIndivudalModel? individualModel;
          if (state.pathParameters['model'] != null) {
            final model = jsonDecode(state.pathParameters['model']!) as Map<String,dynamic>;
            print('model $model');
            if (model['signUpModel'] != null) {
              print('signupmodel ${model['signUpModel']}');
              businessModel = SignUpModel.fromJson(
                  jsonDecode(model['signUpModel']!)
                      as Map<String, dynamic>);
            }
            if (model['signUpIndivudalModel'] != null) {
              print('signUpIndivudalModel ${model['signUpIndivudalModel']}');
              individualModel = SignUpIndivudalModel.fromJson(
                  jsonDecode(model['signUpIndivudalModel']!)
                      as Map<String, dynamic>);
            }
          }
          return ScreenOtpValidation(
              email: state.pathParameters['email']!,
              fromBusiness: state.pathParameters['fromBusiness'] == 'true',
              signUpIndivudalModel: individualModel,
              signUpModel: businessModel);
        },
      ),
      GoRoute(
        name: Routes.cardCreation,
        path: Routes.cardCreation,
        builder: (context, state) => const StartingBusinessCardCreation(),
      ),
      GoRoute(
        name: Routes.homePage,
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
