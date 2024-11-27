// import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
// import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcards_list_section.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/my_connection_section.dart';
// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/constants/constant.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class BizCardHomeScreen extends StatelessWidget {
//   const BizCardHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bizcardController = Get.find<CardController>();
//     final connectionsController = Get.find<ConnectionsController>();
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const HomeAppBarWidget(),
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   bizcardController.getAllcards(true);
//                   connectionsController.fetchMyConnections(true);
//                 },
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       adjustHieght(30.h),
//                       const BizcardsListSection(),
//                       const MyConnectionSection(),
//                       kHeight40,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             kHeight50,
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcards_list_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/my_connection_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:iconsax/iconsax.dart';

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

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        if (Get.find<CardController>().autoScrollCard.value) {
          setState(() {
            pageValue = pageController.page!;
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
  Widget build(BuildContext context) {
    final bizcardController = Get.find<CardController>();
    final connectionsController = Get.find<ConnectionsController>();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // bizcard home appbar
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: false,
              pinned: false,
              flexibleSpace: const HomeAppBarWidget(),
              expandedHeight: kToolbarHeight,
            ),

            // Refresh Indicator
            SliverToBoxAdapter(
              child: RefreshIndicator(
                onRefresh: () async {
                  bizcardController.getAllcards(true);
                  connectionsController.fetchMyConnections(true);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(30.h),
                    const BizcardsListSection(),
                    const MyConnectionSection(),
                  ],
                ),
              ),
            ),

            // Reminders Pinned Header
            SliverPersistentHeader(
              pinned: true,
              delegate: _RemindersSliverHeaderDelegate(),
            ),
            SliverPersistentHeader(
              // pinned: true,
              floating: true,
              delegate: __RemindersSectionSliverHeaderDelegate(
                pageController,
                tabController,
                pageValue,
                (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),

            SliverPersistentHeader(
                pinned: true,
                delegate:
                    __RemindersTabsSectionSliverHeaderDelegate(tabController)),
          ],
        ),
      ),
    );
  }
}

class _RemindersSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Reminders",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 24.sp,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60.h;

  @override
  double get minExtent => 60.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class __RemindersSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  __RemindersSectionSliverHeaderDelegate(this.pageController,
      this.tabController, this.pageValue, this.onIndexChanged);
  final PageController pageController;
  final TabController tabController;
  final double pageValue;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        return PageView.builder(
          allowImplicitScrolling: true,
          controller: pageController,
          onPageChanged: (index) {
            onIndexChanged(index);
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // Calculate the scale and opacity based on the page value
            double scale = 1.0;
            double opacity = 1.0;

            if (pageController.position.haveDimensions) {
              scale = 1 - (pageController.page! - index).abs() * 0.2;
              opacity = 1 - (pageController.page! - index).abs() * 0.5;
            }

            return Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: Card(
                  child: Container(
                    height: 100.h,
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      borderRadius: kBorderRadius15,
                      image: const DecorationImage(
                        image: AssetImage(bizcardBgImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Client Meeting',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '1 week',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kwhite,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Quarterly business review',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: kwhite,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  double get maxExtent => khieght * 0.2;

  @override
  double get minExtent => khieght * 0.2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class __RemindersTabsSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  __RemindersTabsSectionSliverHeaderDelegate(
    this.tabController,
  );

  final TabController tabController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        adjustHieght(20.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kneon,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(23),
              ),
            ),
            child: TabBar(
              indicatorPadding: const EdgeInsets.all(3),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              indicator: BoxDecoration(
                color: kneon,
                borderRadius: kBorderRadius20,
              ),
              labelStyle: textThinStyle1.copyWith(color: kwhite),
              labelColor: kwhite,
              tabs: [
                Tab(
                  child: Text(
                    'History',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Tab(
                  child: Text(
                    'All reminders',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Tab(
                  child: Text(
                    'Upcoming',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Iconsax.calendar_tick),
                                adjustWidth(10.w),
                                Text(
                                  'History',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(personDemoImg),
                            )
                          ],
                        ),
                        adjustHieght(10.h),
                        Text(
                          "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10, color: kGreyNormal),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 9,
                separatorBuilder: (context, index) => SizedBox(height: 3.h),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Iconsax.calendar_tick),
                                adjustWidth(10.w),
                                Text(
                                  'All reminders',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(chatSectionPersonDummyImg2),
                            )
                          ],
                        ),
                        adjustHieght(10.h),
                        Text(
                          "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10, color: kGreyNormal),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 9,
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Iconsax.calendar_tick),
                                adjustWidth(10.w),
                                Text(
                                  'Upcoming',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(chatSectionPersonDummyImg1),
                            )
                          ],
                        ),
                        adjustHieght(10.h),
                        Text(
                          "Your subscription payment is due tomorrow. Please ensure your payment method is up to date to avoid any interruption.",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10, color: kGreyNormal),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: 9,
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
              ),
            ],
          ),
        ),
        kHeight50,
        kHeight50,
        kHeight50,
        kHeight50,
      ],
    );
  }

  @override
  double get maxExtent => khieght;

  @override
  double get minExtent => khieght;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
