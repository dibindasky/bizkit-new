import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/search_bar_widget.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/connections_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/received_cards_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/shared_cards_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/card_and_connections_tab_bars.dart';
import 'widgets/tabs/connection_requests_tab.dart';
import 'widgets/tabs/contact_connections_tab.dart';

class BizCardAndConnectionScreen extends StatefulWidget {
  const BizCardAndConnectionScreen({super.key});

  @override
  State<BizCardAndConnectionScreen> createState() =>
      _BizCardAndConnectionScreenState();
}

class _BizCardAndConnectionScreenState extends State<BizCardAndConnectionScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
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
                searchController: _searchController,
              ),
              adjustHieght(5.h),
              CardAndConnectionsTabBar(tabController: tabController),
              adjustHieght(20.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
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
    tabController.dispose();
    super.dispose();
  }
}
