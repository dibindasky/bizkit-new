// import 'dart:convert';
// import 'package:bizkit/core/routes/routes.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/forgot_password/new_password.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/forgot_password/otp_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/login_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/otp_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/screens/signin_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/business_card_preview/preview_main_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/card_share/view/screen/card_screen_main.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/card_detail_view.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/second_card_detail_view.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/update_second_card.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/create_business_card.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/connections/card_view/card_detail_view_deeplink.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/profile_creation/profile_creation.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/progress_indicator_start.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/notifications/notification_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/navba.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/onbaording_screen/onbaording_screen.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/second_card_feilds.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/selected_card_builder.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/splash_screen/splash_screen.dart';
// import 'package:bizkit/module/biz_card/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
// import 'package:bizkit/module/biz_card/domain/model/auth/sign_up_model/sign_up_model.dart';
// import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GetXRouterConfig {
//   static final List<GetPage> routes = [
//     ...generalRoutes,
//     ...bizCardRoutes,
//     ...taskModuleRoutes,
//   ];

// // general routes bizkit
//   static final List<GetPage> generalRoutes = [
//     GetPage(
//       name: Routes.onBoarding,
//       page: () => const BizkitOnBoardingScreen(),
//     ),
//     GetPage(
//       name: Routes.initial,
//       page: () => const SplashScreen(),
//     ),
//   ];

// // bizcard routes
//   static final List<GetPage> bizCardRoutes = [
//     GetPage(
//       name: '${Routes.newPasswordScreen}/:email',
//       page: () {
//         final email = Get.parameters['email'] ?? '';
//         return NewPasswordFeild(email: email);
//       },
//     ),
//     GetPage(
//       name: '${Routes.otpScreen}/:email',
//       page: () {
//         final email = Get.parameters['email'] ?? '';
//         return ForgottPasswrodOTPScreen(email: email);
//       },
//     ),
//     GetPage(
//       name: '${Routes.cardView}/:cardId',
//       page: () {
//         final cardId = int.tryParse(Get.parameters['cardId'] ?? '');
//         if (cardId != null) {
//           return CardDetailViewDeeplinkScreen(cardId: cardId);
//         } else {
//           return _errorScreen();
//         }
//       },
//     ),
//     GetPage(
//       name: '${Routes.cardDetailView}/:cardId/:myCard',
//       page: () {
//         final cardId = int.tryParse(Get.parameters['cardId'] ?? '');
//         final myCard = Get.parameters['myCard'] == 'true';
//         if (cardId != null) {
//           return ScreenCardDetailView(cardId: cardId, myCard: myCard);
//         } else {
//           return _errorScreen();
//         }
//       },
//     ),
//     GetPage(
//       name: '${Routes.secondcardDetail}/:cardId',
//       page: () {
//         final cardId = int.tryParse(Get.parameters['cardId'] ?? '');
//         return SecondCardDetailView(cardId: cardId);
//       },
//     ),
//     GetPage(
//       name: Routes.linerarProgressBar,
//       page: () => const LinearProgressIndicatorStarting(),
//     ),
//     GetPage(
//       name: Routes.cardListing,
//       page: () => const CardShareMainScreen(),
//     ),
//     GetPage(
//       name: Routes.cardUpdating,
//       page: () =>
//           SecondCardUpdation(secondCard: Get.arguments as SecondCardNew),
//     ),
//     GetPage(
//       name: Routes.loginPage,
//       page: () => const LoGInScreen(),
//     ),
//     GetPage(
//       name: Routes.cardCreationProfilePage,
//       page: () => const ProfileCreationScreen(),
//     ),
//     GetPage(
//       name: Routes.signUpPage,
//       page: () => const SignInscreeen(),
//     ),
//     GetPage(
//       name: Routes.selectedCards,
//       page: () => const SelectedCard(),
//     ),
//     GetPage(
//       name: '${Routes.otpPage}/:email/:fromBusiness/:model',
//       page: () {
//         SignUpModel? businessModel;
//         SignUpIndivudalModel? individualModel;
//         if (Get.parameters['model'] != null) {
//           final model =
//               jsonDecode(Get.parameters['model']!) as Map<String, dynamic>;
//           if (model['signUpModel'] != null) {
//             businessModel = SignUpModel.fromJson(
//                 jsonDecode(model['signUpModel']!) as Map<String, dynamic>);
//           }
//           if (model['signUpIndivudalModel'] != null) {
//             individualModel = SignUpIndivudalModel.fromJson(
//                 jsonDecode(model['signUpIndivudalModel']!)
//                     as Map<String, dynamic>);
//           }
//         }
//         return ScreenOtpValidation(
//           email: Get.parameters['email']!,
//           fromBusiness: Get.parameters['fromBusiness'] == 'true',
//           signUpIndivudalModel: individualModel,
//           signUpModel: businessModel,
//         );
//       },
//     ),
//     GetPage(
//       name: Routes.cardCreation,
//       page: () => const StartingBusinessCardCreation(),
//     ),
//     GetPage(
//       name: Routes.scanedDataFeilds,
//       page: () => CardSecondScannedDatas(),
//     ),
//     GetPage(
//       name: Routes.selfieDataFeilds,
//       page: () => const SelfieTextFields(),
//     ),
//     GetPage(
//       name: Routes.cardListingboth,
//       page: () => const CardShareMainScreen(),
//     ),
//     GetPage(
//       name: Routes.homePage,
//       page: () => const BizkitBottomNavigationBar(),
//     ),
//     GetPage(
//       name: Routes.cardCreationPreview,
//       page: () => const BusinessCardCreationPreviewScreen(),
//     ),
//     GetPage(
//       name: Routes.notificationPage,
//       page: () => const NotificationScreen(),
//     ),
//   ];

// // task module
//   static final List<GetPage> taskModuleRoutes = [];

//   static Widget _errorScreen() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Error')),
//       body: const Center(child: Text('Page not found')),
//     );
//   }
// }
