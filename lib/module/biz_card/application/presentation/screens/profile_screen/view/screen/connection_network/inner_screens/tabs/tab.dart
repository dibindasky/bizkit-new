import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/blocked_business_users.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/company_users.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/request_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: knill,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 17,
              ),
            ),
            title: const Text('Business Users'),
            bottom: const TabBar(
              indicatorWeight: 4,
              enableFeedback: true,
              tabs: [
                Text('Requests'),
                Text('Users'),
                Text('Blocked User'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              RequestsTab(),
              CompanyUsersList(),
              BlockedBusinessUsers(),
            ],
          ),
        ),
      ),
    );
  }
}