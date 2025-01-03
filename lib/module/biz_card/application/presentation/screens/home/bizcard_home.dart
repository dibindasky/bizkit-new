import 'package:bizkit/module/biz_card/application/controller/notifications/bizcard_notification_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/sliver_delegates/reminder_sliver_header.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/sliver_delegates/reminders_tabs_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/sliver_delegates/todays_reminder_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcards_list_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/my_connection_section.dart';
import 'package:bizkit/utils/constants/colors.dart';

class BizCardHomeScreen extends StatefulWidget {
  const BizCardHomeScreen({super.key});

  @override
  State<BizCardHomeScreen> createState() => _BizCardHomeScreenState();
}

class _BizCardHomeScreenState extends State<BizCardHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  late ScrollController
      _scrollController; // Scroll controller for the entire screen

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        if (Get.find<CardController>().autoScrollCard.value) {
          setState(() {
            pageValue = pageController.page ?? 0.0;
          });
        }
      });
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    tabController.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bizcardController = Get.find<CardController>();
    final connectionsController = Get.find<ConnectionsController>();
    final reminderController = Get.find<ReminderController>();
    final notificationController = Get.find<BizcardNotificationController>();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            bizcardController.getAllcards(true);
            connectionsController.fetchMyConnections(true);
            reminderController.fetchRemindersInOrder();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // bizcard home appbar
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                floating: false,
                pinned: false,
                flexibleSpace: const HomeAppBarWidget(),
                expandedHeight: kToolbarHeight,
              ),

              // Bizcards listing and my connections section
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(30.h),
                    const BizcardsListSection(),
                    const MyConnectionSection(),
                    if (reminderController.allReminders.isEmpty ||
                        reminderController.historyReminders.isEmpty ||
                        reminderController.upcomingReminders.isEmpty ||
                        reminderController.todaysReminders.isEmpty)
                      adjustHieght(90.h),
                  ],
                ),
              ),
              // if (reminderController.allReminders.isNotEmpty ||
              //     reminderController.historyReminders.isNotEmpty ||
              //     reminderController.upcomingReminders.isNotEmpty ||
              //     reminderController.todaysReminders.isNotEmpty)
              // Reminders pinned appbar
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: RemindersSliverHeaderDelegate(),
              ),

              // if (reminderController.allReminders.isNotEmpty ||
              //     reminderController.historyReminders.isNotEmpty ||
              //     reminderController.upcomingReminders.isNotEmpty ||
              //     reminderController.todaysReminders.isNotEmpty)
              // Today's reminders horizontal lists section
              SliverPersistentHeader(
                floating: true,
                delegate: TodaysRemindersSectionSliverHeaderDelegate(
                  pageValue,
                  pageController,
                  (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

              // if (reminderController.allReminders.isNotEmpty ||
              //     reminderController.historyReminders.isNotEmpty ||
              //     reminderController.upcomingReminders.isNotEmpty ||
              //     reminderController.todaysReminders.isNotEmpty)
              // Reminder's tabs section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: RemindersTabsSectionSliverHeaderDelegate(
                      tabController, _scrollController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
