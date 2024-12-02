import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/search_bar_widget.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/cards_and_connections_tabs/connections_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/cards_and_connections_tabs/received_cards_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/cards_and_connections_tabs/shared_cards_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/card_and_connections_tab_bars.dart';
import 'cards_and_connections_tabs/connection_requests_tab.dart';
import 'cards_and_connections_tabs/contact_connections_tab.dart';

class BizCardAndConnectionScreen extends StatefulWidget {
  const BizCardAndConnectionScreen({super.key});

  @override
  State<BizCardAndConnectionScreen> createState() =>
      _BizCardAndConnectionScreenState();
}

class _BizCardAndConnectionScreenState extends State<BizCardAndConnectionScreen>
    with TickerProviderStateMixin {
  // late TabController tabController;
  final tabBarController =Get.find<NavbarController>();

  @override
  void initState() {
    super.initState();
   tabBarController.tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  tabBarController.tabController.addListener(() {
      Get.find<ConnectionsController>().searchController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              adjustHieght(10.h),
              SearchBarWidget(
                tabController:tabBarController.tabController,
              ),
              adjustHieght(5.h),
              CardAndConnectionsTabBar(tabController:tabBarController.tabController),
              adjustHieght(20.h),
              Expanded(
                child: TabBarView(
                  controller: tabBarController.tabController,
                  children: const [
                    ConnectionsTab(),
                    ContactConnectionsTab(),
                    ConnectionRequestsTab(),
                    ReceivedCardsTab(),
                    SharedCardsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
   tabBarController.tabController.dispose();
    super.dispose();
  }
}
