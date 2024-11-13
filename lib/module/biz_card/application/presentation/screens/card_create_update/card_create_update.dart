import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BizcardCreateOrUpdateScreen extends StatefulWidget {
  const BizcardCreateOrUpdateScreen({super.key});

  @override
  State<BizcardCreateOrUpdateScreen> createState() => _BizcardCreateOrUpdateScreenState();
}

class _BizcardCreateOrUpdateScreenState extends State<BizcardCreateOrUpdateScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
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
                        'Personal Info',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Business Info',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                )
        ]),
      ),
    );
  }
}
