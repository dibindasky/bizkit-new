import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/business_users.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/user_requests.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          BussinessUserss(),
          RequestsUSersForAddingCompany(),
          RequestsUSersForAddingCompany(),
        ],
      ),
    );
  }
}
