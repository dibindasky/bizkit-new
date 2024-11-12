import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
// import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcards_list_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/my_connection_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardHomeScreen extends StatelessWidget {
  const BizCardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bizcardController = Get.find<CardController>();
    // final connectionsController = Get.find<ConnectionsController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  bizcardController.getAllcards(true);
                  // connectionsController.fetchMyConnections(true);
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adjustHieght(30.h),
                      const BizcardsListSection(),
                      const MyConnectionSection(),
                      kHeight40,
                    ],
                  ),
                ),
              ),
            ),
            kHeight50
          ],
        ),
      ),
    );
  }
}
