import 'dart:async';
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
    tabController = TabController(length: 3, vsync: this);
    // Add auto-scroll functionality
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (pageController.hasClients) {
        int nextPage = (pageController.page!.round() + 1) % 10;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
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

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            bizcardController.getAllcards(true);
            connectionsController.fetchMyConnections(true);
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
                  ],
                ),
              ),

              // Reminders pinned appbar
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: RemindersSliverHeaderDelegate(),
              ),

              // Today's reminders horizontal lists section
              SliverPersistentHeader(
                floating: true,
                delegate: TodaysRemindersSectionSliverHeaderDelegate(
                  pageController,
                  (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

              // Reminder's tabs section
              SliverPersistentHeader(
                pinned: true,
                delegate: RemindersTabsSectionSliverHeaderDelegate(
                    tabController, _scrollController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
