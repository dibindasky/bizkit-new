import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DataManagementScreen extends StatelessWidget {
  const DataManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final receivedCardController = Get.find<ReceivedCardController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  adjustWidth(20.w),
                  Text(
                    'Data Management',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        cardController.fetchDeletedAndArchivedCards();
                        GoRouter.of(context)
                            .pushNamed(Routes.archivedCardScreen);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: kwhite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Archived Cards',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: klightgrey),
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                                child: const Icon(
                                  Iconsax.arrow_right_3,
                                  color: kblack,
                                  size: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        cardController.fetchDeletedAndArchivedCards();
                        receivedCardController.fetchAllDeletedVisitingCards();
                        GoRouter.of(context)
                            .pushNamed(Routes.deletedCardScreen);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: kwhite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Deleted Cards',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: klightgrey),
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                                child: const Icon(
                                  Iconsax.arrow_right_3,
                                  color: kblack,
                                  size: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
