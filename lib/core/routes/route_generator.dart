import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/forgot_password/new_password.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/forgot_password/otp_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/otp_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/signin_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/business_card_preview/preview_main_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_share/view/screen/card_screen_main.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/update_second_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/create_business_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/card_view/card_detail_view_deeplink.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/profile_creation/profile_creation.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/notifications/notification_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/navba.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/onbaording_screen/onbaording_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/second_card_feilds.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/splash/splash_general.dart';
import 'package:bizkit/module/task/application/presentation/screens/navbar/navbar_task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    routes: [
      ...generalRoutes,
      ...bizcardRoute,
      ...taskModuleRoute,
    ],
    errorBuilder: (context, state) => _errorScreen(),
  );

// general routes
  static final generalRoutes = [
    // splash
    GoRoute(
      name: Routes.initial,
      path: Routes.initial,
      builder: (context, state) => const ScreenGeneralSplash(),
    ),
  ];

// biz card routes
  static final bizcardRoute = [
    // splash
    GoRoute(
      name: Routes.initialBizCard,
      path: Routes.initialBizCard,
      builder: (context, state) => const SplashScreen(),
    ),
    //Onboard
    GoRoute(
      name: Routes.onBoardingBizCard,
      path: Routes.onBoardingBizCard,
      builder: (context, state) => const BizkitOnBoardingScreen(),
    ),
    //New Password
    GoRoute(
      name: Routes.newPasswordScreen,
      path: "${Routes.newPasswordScreen}/:email",
      builder: (context, state) {
        final email = state.pathParameters['email'] ?? '';
        return NewPasswordFeild(email: email);
      },
    ),
    //Otp for password change screen
    GoRoute(
      name: Routes.otpScreen,
      path: "${Routes.otpScreen}/:email",
      builder: (context, state) {
        final email = state.pathParameters['email'] ?? '';
        return ForgottPasswrodOTPScreen(email: email);
      },
    ),
    // card view
    GoRoute(
      name: Routes.cardView,
      path: '${Routes.cardView}/:cardId',
      builder: (context, state) {
        final cardId = int.tryParse(state.pathParameters['cardId'] ?? '');
        if (cardId != null) {
          // return ScreenCardDetailView(cardId: cardId);
          return CardDetailViewDeeplinkScreen(cardId: cardId);
        } else {
          return _errorScreen();
        }
      },
    ),
    //First card detail secreen
    GoRoute(
      name: Routes.cardDetailView,
      path: '${Routes.cardDetailView}/:cardId/:myCard',
      builder: (context, state) {
        print('in card view navigator');
        final cardId = int.tryParse(state.pathParameters['cardId'] ?? '');
        final myCard = state.pathParameters['myCard'] == 'true';
        if (cardId != null) {
          return ScreenCardDetailView(cardId: cardId, myCard: myCard);
        } else {
          return _errorScreen();
        }
      },
    ),
    //second card detail
    GoRoute(
      name: Routes.secondcardDetail,
      path: '${Routes.secondcardDetail}/:cardId',
      builder: (context, state) {
        final cardId = int.tryParse(state.pathParameters['cardId'] ?? '');
        return SecondCardDetailView(
          cardId: cardId,
        );
      },
    ),
    GoRoute(
      name: Routes.linerarProgressBar,
      path: Routes.linerarProgressBar,
      builder: (context, state) {
        return const LinearProgressIndicatorStarting();
      },
    ),
    GoRoute(
      name: Routes.cardListing,
      path: Routes.cardListing,
      builder: (context, state) {
        return const CardShareMainScreen();
      },
    ),
    //Card updating
    GoRoute(
      name: Routes.cardUpdating,
      path: Routes.cardUpdating,
      builder: (context, state) {
        return SecondCardUpdation(
          secondCard: state.extra as SecondCardNew,
        );
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
    //Second card creation selected scanned images
    GoRoute(
      name: Routes.selectedCards,
      path: Routes.selectedCards,
      builder: (context, state) => const SelectedCard(),
    ),
    // otp page
    GoRoute(
      name: Routes.otpPage,
      path: '${Routes.otpPage}/:email/:fromBusiness/:model',
      builder: (context, state) {
        SignUpModel? businessModel;
        SignUpIndivudalModel? individualModel;
        if (state.pathParameters['model'] != null) {
          final model = jsonDecode(state.pathParameters['model']!)
              as Map<String, dynamic>;
          if (model['signUpModel'] != null) {
            businessModel = SignUpModel.fromJson(
                jsonDecode(model['signUpModel']!) as Map<String, dynamic>);
          }
          if (model['signUpIndivudalModel'] != null) {
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
    //Second card Creation scanned data fileds
    GoRoute(
      name: Routes.scanedDataFeilds,
      path: Routes.scanedDataFeilds,
      builder: (context, state) => CardSecondScannedDatas(),
    ),
    //Second card Creation selfie data fileds
    GoRoute(
      name: Routes.selfieDataFeilds,
      path: Routes.selfieDataFeilds,
      builder: (context, state) => SelfieTextFields(),
    ),
    GoRoute(
      name: Routes.cardListingboth,
      path: Routes.cardListingboth,
      builder: (context, state) => const CardShareMainScreen(),
    ),
    GoRoute(
      name: Routes.homePage,
      path: Routes.homePage,
      builder: (context, state) => const BizkitBottomNavigationBar(),
    ),
    GoRoute(
      name: Routes.cardCreationPreview,
      path: Routes.cardCreationPreview,
      builder: (context, state) => const BusinessCardCreationPreviewScreen(),
    ),
    GoRoute(
      name: Routes.notificationPage,
      path: Routes.notificationPage,
      builder: (context, state) => const NotificationScreen(),
    ),
  ];

// task module route
  static final taskModuleRoute = [
    // navbar
    GoRoute(
      name: Routes.taskNavbar,
      path: Routes.taskNavbar,
      builder: (context, state) => const ScreenNavbarTaskModule(),
    ),
  ];

  static _errorScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  }
}
