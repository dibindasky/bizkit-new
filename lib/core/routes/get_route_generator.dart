import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/home_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/screen/card_screen_main.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/update_second_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/create_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view_deeplink/card_detail_view_deeplink.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/card_profile_creation/card_profile_creation.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/notifications/notification_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/onbaording_screen/onbaording_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/widgets/second_card_feilds.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/widgets/selected_card_builder.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/login_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/otp_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/signup_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/splash/splash_general.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/task_chat_screen.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/edit_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/notofication.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/tab_notification.dart';
import 'package:bizkit/module/task/application/presentation/screens/navbar/navbar_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/task_detail_page.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_total_time_and_expense.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/total_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXRouterConfig {
  static final routes = [
    ..._generalRoute,
    ..._bizcardRoute,
    ..._taskModuleRoutes,
    ..._attendenceModuleRoutes,
  ];

  /// general routes module managers
  static final _generalRoute = [
    GetPage(
      name: Routes.initial,
      page: () => const ScreenGeneralSplash(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const ScreenLogin(),
    ),
    GetPage(
      name: Routes.signUpPage,
      page: () => const ScreenSignUp(),
    ),
    GetPage(
      name: Routes.otpPage,
      page: () => const ScreenOtpValidation(),
    ),
    GetPage(
      name: Routes.moduleSelector,
      page: () => ScreenModuleSelector(),
    ),
  ];

  /// bizcard routes
  static final _bizcardRoute = [
    GetPage(
      name: Routes.onBoardingBizCard,
      page: () => const ScreenCardOnBoarding(),
    ),
    GetPage(
      name: Routes.cardView,
      page: () => CardDetailViewDeeplinkScreen(
        cardId: Get.parameters['cardId'] != null
            ? int.parse(Get.parameters['cardId']!)
            : -1,
      ),
    ),
    GetPage(
      name: Routes.cardDetailView,
      page: () => const ScreenCardDetailView(),
    ),
    GetPage(
      name: Routes.secondcardDetail,
      page: () => const ScreenCardSecondDetailView(),
    ),
    GetPage(
      name: Routes.linerarProgressBar,
      page: () => const LinearProgressIndicatorStarting(),
    ),
    GetPage(
      name: Routes.cardListing,
      page: () => const ScreenCardsLists(),
    ),
    GetPage(
      name: Routes.cardUpdating,
      page: () => const CardSecondUpdation(),
    ),
    GetPage(
      name: Routes.cardCreationProfilePage,
      page: () => const ScreenCardProfileCreation(),
    ),
    GetPage(
      name: Routes.selectedCards,
      page: () => const SelectedCard(),
    ),
    GetPage(
      name: Routes.cardCreation,
      page: () => const ScreenCardCreationStarting(),
    ),
    GetPage(
      name: Routes.scanedDataFeilds,
      page: () => CardSecondScannedDatas(),
    ),
    GetPage(
      name: Routes.selfieDataFeilds,
      page: () => const SelfieTextFields(),
    ),
    GetPage(
      name: Routes.cardListingboth,
      page: () => const ScreenCardsLists(),
    ),
    GetPage(
      name: Routes.bizCardNavbar,
      page: () => const CardBottomNavigationBar(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => const ScreenCardNotification(),
    ),
  ];

  /// task module routes
  static final _taskModuleRoutes = [
    GetPage(
      name: Routes.taskNavbar,
      page: () => const ScreenNavbarTaskModule(),
    ),
    GetPage(
      name: Routes.taskLists,
      page: () => const ScreenTotalTasksScreen(),
    ),
    GetPage(
      name: Routes.taskDeail,
      page: () => const ScreenTaskDetailPage(),
    ),
    GetPage(
      name: Routes.editTask,
      page: () => ScreenEditTask(
        taskId: Get.parameters['taskId'] ?? '',
      ),
    ),
    GetPage(
      name: Routes.taskNotification,
      page: () => const NotoficationBuilder(),
    ),
    GetPage(
      name: Routes.taskTabNotification,
      page: () => TaskTabNotification(),
    ),
    GetPage(
      name: Routes.heirarchyUserDetail,
      page: () => const ScreenHeirarchyTaskUserDetails(),
    ),
    GetPage(
      name: Routes.taskTotalTimeAndExpense,
      page: () => TaskTotalTimeAndExpenseView(
        isTotalTimeOrExpense: Get.arguments as bool,
      ),
    ),
    GetPage(
      name: Routes.taskChatScreen,
      page: () => const ScreenTaskChat(),
    ),
  ];

  /// Attendance Module Routes
  static final _attendenceModuleRoutes = [
    GetPage(
      name: Routes.attendenceNavbar,
      page: () => const AttendenceNavbarModuleScreen(),
    ),
    GetPage(
      name: Routes.attendenceHome,
      page: () => const AttendenceHomeScreen(),
    ),
    GetPage(
      name: Routes.attendenceOnboaring,
      page: () => const AttendenceOnboardingScreen(),
    ),
  ];

  /// error page
  static errorScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  }
}
