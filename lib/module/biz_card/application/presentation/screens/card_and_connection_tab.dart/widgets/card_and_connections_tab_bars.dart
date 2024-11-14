import 'package:flutter/material.dart';

class CardAndConnectionsTabBar extends StatelessWidget {
  const CardAndConnectionsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
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
          child: Text(
            'Connection requests',
            style: Theme.of(context).textTheme.displaySmall,
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
