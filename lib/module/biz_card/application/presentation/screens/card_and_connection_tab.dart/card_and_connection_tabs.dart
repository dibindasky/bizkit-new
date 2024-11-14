import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/search_bar_widget.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/connections_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/received_cards_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/tabs/shared_cards_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
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
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isSearching) {
          FocusScope.of(context).unfocus();
          _stopSearch();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                adjustHieght(10.h),
                GestureDetector(
                  onTap: _startSearch,
                  child: SearchBarWidget(
                    isSearching: _isSearching,
                    searchController: _searchController,
                  ),
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
                )
              ],
            ),
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
