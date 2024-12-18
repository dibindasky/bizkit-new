import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/home_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/add_connection/add_connection_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/pending_connections/pending_connections_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_create_update.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/achivements/bizcard_create_achivement_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/dates_to_remember/bizcard_dates_to_remember_create_update.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/products/bizcard_create_update_products.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/social_media_handles/card_detail_social_media_handle_create_update.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/create_bizcard.dart/create_business_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/create_card_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/connection_detils/card_detail_connection_detils_create.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/scan_and_connect_card_detail_page.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/achivement/bizcard_detail_achivements.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/personal_and_banking/bizcard_detail_banking_and_personal_detail.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/product/bizcard_product_detail_page.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_notifications/card_notifications.dart';

import 'package:bizkit/module/biz_card/application/presentation/screens/level_sharing/level_sharing_settings.dart';

import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/card_detail_page.dart';

import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/biz_card_nav_bar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/received_card_detail/received_card_detail_page.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_create_update.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_detail.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/widgets/second_card_field.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/cards_listing/screen/card_screen_main.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/card_profile_creation/card_profile_creation.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/picked_scanning_cards/picked_scanning_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/connections/connection_request_sscreen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/connections/shared_cards_list_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/connections/view_all_connection_contacts.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/home/view/home_first_screen/first_half_sction/widgets/cards_based_on_user.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/notifications/notification_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/onbaording_screen/onbaording_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/pdf/pdf_preview_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/module/biz_card/domain/model/reminder/reminders_success_responce/reminder.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/varification_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/onboarding/onboarding_general.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/connection_and_network/connections_and_networking.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/data_management/archived_data/archived_data_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/data_management/data_management_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/data_management/deleted_data/deleted_data_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/macho_meter/macho_meter_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/qr_screen/level_sharing_settings.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/received_cards/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/account_switching/account_switching_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/account_settings/profile_edit_screen.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/widgets/matcho_meter_connection_screen/matcho_meter_connection_screen.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/inside_the_inner_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/add_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/reports_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/search_tasks.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_search.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/quick_task_create_update.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/quick_task_received_req.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/quick_tasks_listing.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/total_tasks_screen.dart';
import 'package:bizkit/utils/images/image_slidable_list.dart';
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
      name: Routes.onBoarding,
      path: Routes.onBoarding,
      // builder: (context, state) => const ScreenConnectionDetailFilling(),
      builder: (context, state) => const ScreenOnboardingGeneral(),
    ),

    // Splash
    GoRoute(
      name: Routes.initial,
      path: Routes.initial,
      // builder: (context, state) => const ScreenConnectionDetailFilling(),
      builder: (context, state) => const ScreenGeneralSplash(),
    ),

    GoRoute(
        name: Routes.varificationScreen,
        path: Routes.varificationScreen,
        builder: (context, state) {
          final data = state.extra as bool;
          return VarificationScreen(
            islogin: data,
          );
        }),

    GoRoute(
      path: Routes.machoMeterScreen,
      name: Routes.machoMeterScreen,
      builder: (context, state) => const MachoMeterScreen(),
    ),

    //blocked and restricked connection screen
    GoRoute(
      name: Routes.connectionsAndNetworking,
      path: Routes.connectionsAndNetworking,
      builder: (context, state) => const ConnectionsAndNetworking(),
    ),

    // Account switching loader
    GoRoute(
      name: Routes.accountSwitching,
      path: Routes.accountSwitching,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
            key: state.pageKey, child: const ScreenAccountSwitchingLoader());
      },
      // builder: (context, state) => const ScreenConnectionDetailFilling(),
      // builder: (context, state) => const ScreenAccountSwitchingLoader(),
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
              isEmail: data['email'] as bool, route: data['route'] as String?);
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
          images: (extra['images'] as List<String>?) ?? <String>[],
          initialIndex: extra['initial'] ?? 0,
          isMemory: extra['memory'] ?? false,
          isFile: extra['file'] ?? false,
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

    GoRoute(
      name: Routes.deletedCardScreen,
      path: Routes.deletedCardScreen,
      builder: (context, state) => DeletedCardScreen(),
    ),
    GoRoute(
      name: Routes.archivedCardScreen,
      path: Routes.archivedCardScreen,
      builder: (context, state) => ArchivedCardScreen(),
    ),
    GoRoute(
      name: Routes.dataManagementScreen,
      path: Routes.dataManagementScreen,
      builder: (context, state) => DataManagementScreen(),
    ),

    GoRoute(
      name: Routes.matchoMeterConnectionScreen,
      path: Routes.matchoMeterConnectionScreen,
      builder: (context, state) => MatchoMeterConnectionScreen(),
    )
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
        return BizcardReminderCreateUpdateScreen(
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
          return BizCardScanAndConnectCardDetailScreen(cardId: cardId);
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
          return BizCardScanAndConnectCardDetailScreen(cardId: cardId);
        } else {
          return _errorScreen();
        }
      },
    ),

    // Bizcard product detail view
    GoRoute(
      name: Routes.cardProductDetail,
      path: Routes.cardProductDetail,
      pageBuilder: (context, state) {
        Product? product = (state.extra) as Product;
        return FadeTransitionPage(
          key: state.pageKey,
          child: BizcardProductDetailScreen(
            product: product,
          ),
        );
      },
    ),

    // Reminder Detail view
    GoRoute(
      name: Routes.reminderDetail,
      path: Routes.reminderDetail,
      pageBuilder: (context, state) {
        Reminder? reminder = (state.extra) as Reminder;
        return FadeTransitionPage(
          key: state.pageKey,
          child: BizcardReminderDetailScreen(
            reminder: reminder,
          ),
        );
      },
    ),

    GoRoute(
      name: Routes.cardDetailView,
      path: '${Routes.cardDetailView}/:cardId/:myCard/:fromPreview',
      pageBuilder: (context, state) {
        final cardId = state.pathParameters['cardId'] ?? '';
        final myCard = state.pathParameters['myCard'] == 'true';
        final fromPreview = state.pathParameters['fromPreview'] == 'true';
        if (cardId != null) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: BizCardDetailScreen(
                cardId: cardId, myCard: myCard, fromPreview: fromPreview),
          );
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
        return BizCardConnectionDetailUpdateScreen(
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
        return const BizcardCreateOrUpdateScreen();
      },
    ),

    GoRoute(
      name: Routes.cardCreationProfilePage,
      path: Routes.cardCreationProfilePage,
      builder: (context, state) => const ScreenCardProfileCreation(),
    ),

    GoRoute(
      name: Routes.cardBankingOrPersonalDetail,
      path: Routes.cardBankingOrPersonalDetail,
      builder: (context, state) => BizcardDetailBankingAndPersonalDetail(
        isFromBankScreen: state.extra as bool,
      ),
    ),

    GoRoute(
      name: Routes.cardAchivements,
      path: Routes.cardAchivements,
      builder: (context, state) => const BizCardDeatailAchivements(),
    ),

    GoRoute(
      name: Routes.cardAchivementCreateUpdate,
      path: Routes.cardAchivementCreateUpdate,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        if (!extra.containsKey('fromBusiness')) return _errorScreen();
        return BizCardAchivementCreationAndUpdation(
            fromBusiness: extra['fromBusiness'] as bool,
            achievement: extra['achivement'] as Achievement?);
      },
    ),

    GoRoute(
      name: Routes.cardSocialMediaCreateUpdate,
      path: Routes.cardSocialMediaCreateUpdate,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        if (!extra.containsKey('fromBusiness')) return _errorScreen();
        return BizCardSocialMediaCreateUpdateScreen(
            fromBusiness: extra['fromBusiness'] as bool);
      },
    ),

    GoRoute(
      name: Routes.cardDatesToRememberCreateUpdate,
      path: Routes.cardDatesToRememberCreateUpdate,
      builder: (context, state) =>
          const BizcardDatesToRememberCreateUpdateScreen(),
    ),

    GoRoute(
      name: Routes.cardProductsCreateOrUpdate,
      path: Routes.cardProductsCreateOrUpdate,
      builder: (context, state) {
        final map = state.extra as Map<String, dynamic>?;
        return BizcardProductCreateUpdateScreen(
            selctedIndex: map?['index'] as int?,
            product: map?['product'] as Product?);
      },
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
      builder: (context, state) => const BizcardCreateScreen(),
    ),

    // card creation starting page
    GoRoute(
      name: Routes.cardCreationDetailAdding,
      path: Routes.cardCreationDetailAdding,
      builder: (context, state) => const BizCardCreateDetailScreen(),
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
      builder: (context, state) => BizCardNavBarScreen(),
    ),

    GoRoute(
      name: Routes.notificationPage,
      path: Routes.notificationPage,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ScreenCardNotification(),
        );
      },
    ),

    GoRoute(
      name: Routes.cardPickedScanningCards,
      path: Routes.cardPickedScanningCards,
      builder: (context, state) => const PickedScanningCards(),
    ),

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

    // receivedCardDetail
    GoRoute(
      name: Routes.receivedCardDetail,
      path: Routes.receivedCardDetail,
      pageBuilder: (context, state) {
        final extra = state.extra as String;
        return FadeTransitionPage(
          key: state.pageKey,
          child: ReceivedCardDetailScreen(
            visitingCardId: extra,
          ),
        );
      },
    ),

    // pendingConnectionRequests
    GoRoute(
      name: Routes.pendingConnectionRequests,
      path: Routes.pendingConnectionRequests,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const PendingConnectionRequestsScreen(),
        );
      },
    ),

    //  Card QR code screen
    GoRoute(
      name: Routes.levelSharingSettings,
      path: Routes.levelSharingSettings,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FadeTransitionPage(
          key: state.pageKey,
          child: BizCardLevelSharingScreen(
            isCommonLevelSharing: extra['isCommonLevelSharing'],
            bizcardId: extra['bizcardId'],
          ),
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
          child: const AddConnectionScreen(),
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

    // Tasks Screen
    GoRoute(
      name: Routes.taskLists,
      path: Routes.taskLists,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FadeTransitionPage(
          key: state.pageKey,
          child: TotalTasksScreen(
            fromHeirarachy: extra['fromHeirarachy'],
            targetUserId: extra['targetUserId'],
          ),
        );
      },
    ),

// Quick Task Create & Update
    GoRoute(
      name: Routes.quickTaskCreateUpdate,
      path: Routes.quickTaskCreateUpdate,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FadeTransitionPage(
          key: state.pageKey,
          child: QuickTaskCreateUpdateScreen(
            edit: extra['edit'],
            quickTaskId: extra['quickTaskId'],
          ),
        );
      },
    ),

    // Quick tasks listing active quick tasks and completed quick taks
    GoRoute(
      name: Routes.quickTasksListing,
      path: Routes.quickTasksListing,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const QuickTasksListingScreen(),
        );
      },
    ),

    // Task Home screen
    GoRoute(
      name: Routes.taskHome,
      path: Routes.taskHome,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const TaskHomeScreen(),
        );
      },
    ),

    // Task search screen
    GoRoute(
      name: Routes.taskSearch,
      path: Routes.taskSearch,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const TaskSearchScreen(),
        );
      },
    ),

    // Task creation screen
    GoRoute(
      name: Routes.addTask,
      path: Routes.addTask,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: ScreenAddTask(),
        );
      },
    ),

    // Tasks inside a inner folder - screen
    GoRoute(
      name: Routes.taskInsideTheInnerFolderScreen,
      path: Routes.taskInsideTheInnerFolderScreen,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FadeTransitionPage(
          key: state.pageKey,
          child: TaskInsideTheInnerFolderScreen(
            arguments: extra,
          ),
        );
      },
    ),

    // Task calender section -
    GoRoute(
      name: Routes.taskCalenderView,
      path: Routes.taskCalenderView,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ScreenTaskCalenderView(),
        );
      },
    ),

    //  Generate tasks search  -
    GoRoute(
      name: Routes.generateTasksSearch,
      path: Routes.generateTasksSearch,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const SearchTasksWidget(),
        );
      },
    ),

    //  Generate tasks - list view
    GoRoute(
      name: Routes.reportsview,
      path: Routes.reportsview,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const ReportsView(),
        );
      },
    ),

    //   HeirarchyTask User Details
    GoRoute(
      name: Routes.heirarchyUserDetail,
      path: Routes.heirarchyUserDetail,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return FadeTransitionPage(
          key: state.pageKey,
          child: ScreenHeirarchyTaskUserDetails(
            folderId: extra['folderId'],
            folderName: extra['folderName'],
          ),
        );
      },
    ),

// Quick tasks received requests  listing
    GoRoute(
      name: Routes.quickTaskReceivedRequests,
      path: Routes.quickTaskReceivedRequests,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const QuickTaskReceivedReqScreen(),
        );
      },
    ),

    // Tasks Screen
    GoRoute(
      name: Routes.taskDeail,
      path: '${Routes.taskDeail}/:taskId',
      pageBuilder: (context, state) {
        final taskId = state.pathParameters['taskId'] ?? '';
        final extra = state.extra as Map<String, dynamic>?;
        if (taskId != '') {
          return FadeTransitionPage(
            key: state.pageKey,
            child: ScreenTaskDetailPage(
                taskId: taskId,
                fromHeirarchy: (extra?['fromHeirarchy'] as bool?) ?? false),
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

    // Tsks notification
    GoRoute(
      name: Routes.taskNotification,
      path: Routes.taskNotification,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: const NotoficationBuilder(),
        );
      },
    ),

    GoRoute(
      name: Routes.taskTabNotification,
      path: Routes.taskTabNotification,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: TaskTabNotification(),
        );
      },
    ),

    // chat Screen task
    GoRoute(
      name: Routes.taskTotalTimeAndExpense,
      path: Routes.taskTotalTimeAndExpense,
      pageBuilder: (context, state) {
        final extra = state.extra as String;
        return FadeTransitionPage(
          key: state.pageKey,
          child: TaskTotalTimeAndExpenseView(
            taskId: extra,
          ),
        );
      },
    ),
    GoRoute(
      name: Routes.taskChatScreen,
      path: Routes.taskChatScreen,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        return FadeTransitionPage(
          key: state.pageKey,
          child: ScreenTaskChat(
            active: extra['active'],
            taskTitle: extra['taskTitle'],
          ),
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
