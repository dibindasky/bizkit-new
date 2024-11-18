import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardAndConnectionsTabBar extends StatelessWidget {
  const CardAndConnectionsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    return TabBar(
      overlayColor: WidgetStateColor.transparent,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.grey,
      controller: tabController,
      indicatorColor: Theme.of(context).colorScheme.primary,
      labelColor: Theme.of(context).colorScheme.onPrimary,
      tabs: [
        Tab(
          child: Text(
            'Connections',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Tab(
          child: Text(
            'Contacts',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Tab(
          child: Badge(
            offset: const Offset(10, -3),
            label: Obx(
              () => Text(
                '${connectionsController.recievedConnectionRequests.length}',
                style: const TextStyle(color: kblack),
              ),
            ),
            isLabelVisible: true,
            backgroundColor: kneon,
            textColor: kblack,
            child: Text(
              'Connection requests',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Received cards',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Tab(
          child: Text(
            'Shared cards',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
