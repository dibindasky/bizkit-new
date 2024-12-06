import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/business_info/card_detail_update_business_info.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'card_details_create_or_update/banking_info/card_detail_update_banking_info.dart';
import 'card_details_create_or_update/logo_story/card_detail_update_logo_story.dart';
import 'card_details_create_or_update/personal_info/card_detail_update_personal_info.dart';
import 'card_details_create_or_update/products/card_detail_update_products.dart';

class BizcardCreateOrUpdateScreen extends StatefulWidget {
  const BizcardCreateOrUpdateScreen({super.key});

  @override
  State<BizcardCreateOrUpdateScreen> createState() =>
      _BizcardCreateOrUpdateScreenState();
}

class _BizcardCreateOrUpdateScreenState
    extends State<BizcardCreateOrUpdateScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accessController = Get.find<AccessController>();
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          kHeight10,
          Row(
            children: [
              kWidth20,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 15.sp,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              kWidth10,
              Text('Edit Card',
                  style: Theme.of(context).textTheme.displayMedium)
            ],
          ),
          kHeight10,
          TabBar(
            indicatorPadding: const EdgeInsets.all(5),
            dividerColor: knill,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            controller: tabController,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: kBorderRadius20,
            ),
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text('Personal Info',
                      style: Theme.of(context).textTheme.displaySmall)),
              if (accessController.userRole.value == 'user')
                Tab(
                    child: Text('Business info',
                        style: Theme.of(context).textTheme.displaySmall)),
              if (accessController.userRole.value == 'user')
                Tab(
                    child: Text('Logo Story',
                        style: Theme.of(context).textTheme.displaySmall)),
              if (accessController.userRole.value == 'user')
                Tab(
                    child: Text('Products',
                        style: Theme.of(context).textTheme.displaySmall)),
              if (accessController.userRole.value == 'user')
                Tab(
                    child: Text('Commercial info',
                        style: Theme.of(context).textTheme.displaySmall)),
            ],
          ),
          kHeight10,
          Obx(
            () => Expanded(
              child: Get.find<CardController>().isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: tabController,
                      children: [
                        CardUpdatePersonalDetails(),
                        if (accessController.userRole.value == 'user')
                          CardUpdateBusinesstDetails(),
                        if (accessController.userRole.value == 'user')
                          const CardUpdateLogoStoryDetails(),
                        if (accessController.userRole.value == 'user')
                          const CardUpdateProductDetails(),
                        if (accessController.userRole.value == 'user')
                          CardUpdateBankingDetails(),
                      ],
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
