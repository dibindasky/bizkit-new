import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/business_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/utils/animations/pageview_animated_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BizCardHomeScreen extends StatefulWidget {
  const BizCardHomeScreen({super.key});

  @override
  State<BizCardHomeScreen> createState() => _BizCardHomeScreenState();
}

class _BizCardHomeScreenState extends State<BizCardHomeScreen> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(30.h),
                    SizedBox(
                      width: 382.w,
                      height: 450.h,
                      child: PagviewAnimateBuilder(
                        pageController: pageController,
                        pageValue: pageValue,
                        pageCount: 6,
                        onpageCallBack: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: (index, context) {
                          if (index >= 5) {
                            return const Center(
                              child: Center(child: Icon(Icons.add)),
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: BusinessCard(),
                            );
                          }
                        },
                      ),
                    ),
                    adjustHieght(20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Scanned Contacts',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          adjustHieght(20.h),
                          SizedBox(
                            height: 90.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: false,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                              chatSectionPersonDummyImg2),
                                        ),
                                        adjustHieght(5.h),
                                        Text(
                                          'Zahir',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      ],
                                    ),
                                separatorBuilder: (context, index) => kWidth10,
                                itemCount: 10),
                          ),
                        ],
                      ),
                    ),
                    kHeight40,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
