import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/home_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/connection_details/connection_detail_filling.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/update_second_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view_deeplink/card_detail_view_deeplink.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/screen/card_screen_main.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/card_profile_creation/card_profile_creation.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/create_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/picked_scanning_cards/picked_scanning_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/connection_request_sscreen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/shared_cards_list_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/view_all_connection_contacts.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/first_half_sction/widgets/cards_based_on_user.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/notifications/notification_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/onbaording_screen/onbaording_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/pdf/pdf_preview_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/matcho_meter.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/level_sharing_settings.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/qr_lists.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/received_cards/widgets/second_card_feilds.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/received_cards/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_create_update.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/account_switching/account_switching_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/profile_edit_screen.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/login_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/otp_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/signup_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/module/module_selector.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/splash/splash_general.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/poll_creation_page.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/poll_detail_page.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/task_chat_screen.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/edit_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/notofication.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/tab_notification.dart';
import 'package:bizkit/module/task/application/presentation/screens/navbar/navbar_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/task_detail_page.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/attachments_detil_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_total_time_and_expense.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/total_tasks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    routes: [
      ...generalRoutes,
      ...bizcardRoute,
      ...taskModuleRoute,
      ...attendeceModule
    ],
    errorBuilder: (context, state) => _errorScreen(),
  );
//  <------------------------------------------------------------------------------>

  /// general routes
  static final generalRoutes = [
    // Splash
    GoRoute(
      name: Routes.initial,
      path: Routes.initial,
      // builder: (context, state) => const ScreenConnectionDetailFilling(),
      builder: (context, state) => const ScreenGeneralSplash(),
    ),

    // Account switching loader
    GoRoute(
      name: Routes.accountSwitching,
      path: Routes.accountSwitching,
      // builder: (context, state) => const ScreenConnectionDetailFilling(),
      builder: (context, state) => const ScreenAccountSwitchingLoader(),
    ),

    // login page
    GoRoute(
      name: Routes.loginPage,
      path: Routes.loginPage,
      builder: (context, state) => const ScreenLogin(),
    ),

    // signup page
    GoRoute(
      name: Routes.signUpPage,
      path: Routes.signUpPage,
      builder: (context, state) => const ScreenSignUp(),
    ),

    // Otp page
    GoRoute(
        name: Routes.otpPage,
        path: Routes.otpPage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ScreenOtpValidation(
              isEmail: data['email'] as bool,
              route: data['route'] as String?);
        }),

    // Module selector
    GoRoute(
      name: Routes.moduleSelector,
      path: Routes.moduleSelector,
      builder: (context, state) => ScreenModuleSelector(),
    ),

    // slidable photo gallary
    GoRoute(
      name: Routes.slidablePhotoGallery,
      path: Routes.slidablePhotoGallery,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return SlidablePhotoGallery(
          images: extra['images'] as List<String>,
          initialIndex: extra['initial'],
          isMemory: extra['memory'],
        );
      },
    ),

    // slidable photo gallary
    GoRoute(
      name: Routes.pdfPreview,
      path: Routes.pdfPreview,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ScreenPdfPreview(
          base64: extra['base64'],
          filePath: extra['filePath'],
          label: extra['label'],
        );
      },
    ),
    GoRoute(
      name: Routes.editProfile,
      path: Routes.editProfile,
      builder: (context, state) => const ScreenProfileEdit(),
    ),
  ];

//  <------------------------------------------------------------------------------>
  /// biz card routes
  static final bizcardRoute = [
    //On board
    GoRoute(
      name: Routes.onBoardingBizCard,
      path: Routes.onBoardingBizCard,
      builder: (context, state) => const ScreenCardOnBoarding(),
    ),

    // Connection all cards Listing
    GoRoute(
      name: Routes.myConnectionsAllCards,
      path: Routes.myConnectionsAllCards,
      builder: (context, state) => const CardsbasedOnUserConnection(),
    ),

    // shared cards listing screen
    GoRoute(
      name: Routes.sharedCardsScreeen,
      path: Routes.sharedCardsScreeen,
      builder: (context, state) => const ScreenSharedCardListing(),
    ),

    // Reminder creation
    GoRoute(
      name: Routes.reminderCreation,
      path: Routes.reminderCreation,
      builder: (context, state) {
        // final cardId = state.pathParameters['cardID'] ?? '';
        // final connectionId = state.pathParameters['connectionId'] ?? '';
        // if (cardId != '' && connectionId != '') {

        final extra = state.extra as Map<String, dynamic>;
        return ScreenCardReminderCreating(
          cardId: extra['cardId'],
          connectionId: extra['connectionId'],
        );
        // } else {
        //   return _errorScreen();
        // }
      },
    ),

    // Card view
    GoRoute(
      name: Routes.cardView,
      path: '${Routes.cardView}/:cardId',
      builder: (context, state) {
        String? cardId = state.pathParameters['cardId'];
        cardId ?? (state.extra) as String?;
        if (cardId != null) {
          return CardDetailViewDeeplinkScreen(cardId: cardId);
        } else {
          return _errorScreen();
        }
      },
    ),

    // Card view
    GoRoute(
      name: Routes.cardViewDeeplinking,
      path: Routes.cardViewDeeplinking,
      builder: (context, state) {
        String? cardId = (state.extra) as String?;
        if (cardId != null) {
          return CardDetailViewDeeplinkScreen(cardId: cardId);
        } else {
          return _errorScreen();
        }
      },
    ),

    // First card detail secreen
    GoRoute(
      name: Routes.cardDetailView,
      path: '${Routes.cardDetailView}/:cardId/:myCard',
      builder: (context, state) {
        final cardId = state.pathParameters['cardId'] ?? '';
        final myCard = state.pathParameters['myCard'] == 'true';
        if (cardId != null) {
          return ScreenCardDetailView(cardId: cardId, myCard: myCard);
        } else {
          return _errorScreen();
        }
      },
    ),
    // connection detail filling
    GoRoute(
      name: Routes.connectionDetailFilling,
      path: Routes.connectionDetailFilling,
      builder: (context, state) {
        return ScreenConnectionDetailFilling(
          cardDetailModel: (state.extra as CardDetailModel?),
        );
      },
    ),
    //second card detail
    GoRoute(
      name: Routes.secondcardDetail,
      path: Routes.secondcardDetail,
      builder: (context, state) {
        return const ScreenCardSecondDetailView();
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
        return const ScreenCardsLists();
      },
    ),

    // Card updating
    GoRoute(
      name: Routes.cardUpdating,
      path: Routes.cardUpdating,
      builder: (context, state) {
        return const CardSecondUpdation();
      },
    ),

    GoRoute(
      name: Routes.cardCreationProfilePage,
      path: Routes.cardCreationProfilePage,
      builder: (context, state) => const ScreenCardProfileCreation(),
    ),

    GoRoute(
      name: Routes.matchoMeter,
      path: Routes.matchoMeter,
      builder: (context, state) => const CardMatchoMeter(),
    ),

    // Second card creation selected scanned images
    GoRoute(
      name: Routes.selectedCards,
      path: Routes.selectedCards,
      builder: (context, state) => const SelectedCard(),
    ),

    // card creation starting page
    GoRoute(
      name: Routes.cardCreation,
      path: Routes.cardCreation,
      builder: (context, state) => const ScreenCardCreationStarting(),
    ),

    // Second card Creation scanned data fileds
    GoRoute(
      name: Routes.scanedDataFeilds,
      path: Routes.scanedDataFeilds,
      builder: (context, state) => CardSecondScannedDatas(),
    ),
    //Second card Creation selfie data fileds
    GoRoute(
      name: Routes.selfieDataFeilds,
      path: Routes.selfieDataFeilds,
      builder: (context, state) => const SelfieTextFields(),
    ),
    GoRoute(
      name: Routes.cardListingboth,
      path: Routes.cardListingboth,
      builder: (context, state) => const ScreenCardsLists(),
    ),

    GoRoute(
      name: Routes.bizCardNavbar,
      path: Routes.bizCardNavbar,
      builder: (context, state) => CardBottomNavigationBar(),
    ),

    GoRoute(
      name: Routes.notificationPage,
      path: Routes.notificationPage,
      builder: (context, state) => const ScreenCardNotification(),
    ),

    GoRoute(
      name: Routes.cardPickedScanningCards,
      path: Routes.cardPickedScanningCards,
      builder: (context, state) => const PickedScanningCards(),
    ),

    // individual Level sharing  screen
    // GoRoute(
    //   name: Routes.individualLevelSharing,
    //   path: Routes.individualLevelSharing,
    //   pageBuilder: (context, state) {
    //     return FadeTransitionPage(
    //       key: state.pageKey,
    //       child: const ScreenCardLevelSharing(),
    //     );
    //   },
    // ),

    //  Level sharing screen
    GoRoute(
      name: Routes.levelSharing,
      path: Routes.levelSharing,
      pageBuilder: (context, state) {
        final extra = state.extra as bool;
        return FadeTransitionPage(
          key: state.pageKey,
          child: CardDefaultLevelSharing(
            isCommonLevelSharing: extra,
          ),
        );
      },
    ),

    //  Card QR code screen
    GoRoute(
      name: Routes.cardQrCode,
      path: Routes.cardQrCode,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ScreenCardSharing(),
        );
      },
    ),
    // Add  new connection screen
    GoRoute(
      name: Routes.addConnection,
      path: Routes.addConnection,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ScreenCardAddConnections(),
        );
      },
    ),

    // recieved Connections Requests
    GoRoute(
      name: Routes.recievedConnectionRequests,
      path: Routes.recievedConnectionRequests,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ScreenConnectionRequests(),
        );
      },
    ),

    // My all connections and contacts screen
    GoRoute(
      name: Routes.myAllConnectionsAndContacts,
      path: Routes.myAllConnectionsAndContacts,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const MyConnectionsViewAllContacts(),
        );
      },
    ),
  ];

//  <------------------------------------------------------------------------------>

  /// task module route
  static final taskModuleRoute = [
    // Navbar
    GoRoute(
      name: Routes.taskNavbar,
      path: Routes.taskNavbar,
      builder: (context, state) => const ScreenNavbarTaskModule(),
    ),
    // add task screen
    // GoRoute(
    //   name: Routes.addTask,
    //   path: "${Routes.addTask}/:edit/:navid",
    //   builder: (context, state) {
    //     final edit = state.pathParameters['edit'] ?? '';
    //     // final navId = state.pathParameters['navid'] ?? '';
    //     return ScreenAddTask(
    //       navigationId: int.parse(navId),
    //       edit: edit == 'true',
    //     );
    //   },
    // ),

    // Tasks Screen
    GoRoute(
      name: Routes.taskLists,
      path: Routes.taskLists,
      builder: (context, state) => const ScreenTotalTasksScreen(),
    ),

    // Tasks Screen
    GoRoute(
      name: Routes.taskDeail,
      path: '${Routes.taskDeail}/:taskId',
      builder: (context, state) {
        final taskId = state.pathParameters['taskId'] ?? '';
        if (taskId != '') {
          return ScreenTaskDetailPage(
            taskId: taskId,
          );
        } else {
          return _errorScreen();
        }
      },
    ),
    GoRoute(
      name: Routes.editTask,
      path: '${Routes.editTask}/:taskId',
      builder: (context, state) {
        final taskId = state.pathParameters['taskId'] ?? '';
        if (taskId != '') {
          return ScreenEditTask(taskId: taskId);
        } else {
          return _errorScreen();
        }
      },
    ),

    //  GoRoute(
    //   name: Routes.secondcardDetail,
    //   path: '${Routes.secondcardDetail}/:cardId',
    //   builder: (context, state) {
    //     final cardId = int.tryParse(state.pathParameters['cardId'] ?? '');
    //     return SecondCardDetailView(
    //       cardId: cardId,
    //     );
    //   },
    // ),

    // Tsks notification
    GoRoute(
      name: Routes.taskNotification,
      path: Routes.taskNotification,
      builder: (context, state) => const NotoficationBuilder(),
    ),

    GoRoute(
      name: Routes.taskTabNotification,
      path: Routes.taskTabNotification,
      builder: (context, state) => TaskTabNotification(),
    ),

    // HeirarchyUserDetail
    GoRoute(
      name: Routes.heirarchyUserDetail,
      path: Routes.heirarchyUserDetail,
      builder: (context, state) => const ScreenHeirarchyTaskUserDetails(),
    ),

    // chat Screen task
    GoRoute(
      name: Routes.taskTotalTimeAndExpense,
      path: Routes.taskTotalTimeAndExpense,
      builder: (context, state) {
        final extra = state.extra as String;
        return TaskTotalTimeAndExpenseView(
          taskId: extra,
        );
      },
    ),
    GoRoute(
      name: Routes.taskChatScreen,
      path: Routes.taskChatScreen,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ScreenTaskChat(
          active: extra['active'],
          taskTitle: extra['taskTitle'],
        );
      },
    ),

    // task attachmets detail list view
    GoRoute(
      name: Routes.taskAttachmetnsList,
      path: Routes.taskAttachmetnsList,
      builder: (context, state) {
        return const ScreenTaskDetailAttachmentsDetailList();
      },
    ),

    // task chat poll creation page
    GoRoute(
      name: Routes.taskChatPollCration,
      path: Routes.taskChatPollCration,
      builder: (context, state) {
        return const ScreenPollCreation();
      },
    ),

    // task chat poll Detail page
    GoRoute(
      name: Routes.taskChatPollDetail,
      path: Routes.taskChatPollDetail,
      builder: (context, state) {
        return const ScreenPollDetailTask();
      },
    ),
  ];

  //  <------------------------------------------------------------------------------>

  /// Attendence module
  static final attendeceModule = [
    //Navabar
    GoRoute(
      name: Routes.attendenceNavbar,
      path: Routes.attendenceNavbar,
      builder: (context, state) => const AttendenceNavbarModuleScreen(),
    ),
    //Home
    GoRoute(
      name: Routes.attendenceHome,
      path: Routes.attendenceHome,
      builder: (context, state) => const AttendenceHomeScreen(),
    ),
    GoRoute(
      name: Routes.attendenceOnboaring,
      path: Routes.attendenceOnboaring,
      builder: (context, state) => const AttendenceOnboardingScreen(),
    ),
  ];

  static _errorScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  }
}

const a = [
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "com.bizkit.mobile",
      "package_name": "com.bizkit.mobile",
      "sha256_cert_fingerprints": [
        "E9:85:EB:08:C4:7A:47:D3:E7:37:52:CB:8F:61:32:77:2D:E6:13:45:D3:C9:34:5C:36:4D:70:7A:A1:11:A1:91"
      ]
    }
  }
];
