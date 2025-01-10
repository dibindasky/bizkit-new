import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DataManagementScreen extends StatefulWidget {
  const DataManagementScreen({super.key});

  @override
  State<DataManagementScreen> createState() => _DataManagementScreenState();
}

class _DataManagementScreenState extends State<DataManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final moduleController = Get.find<ModuleController>();

    final cardController = moduleController.currentModule.value == Module.card
        ? Get.find<CardController>()
        : null;
    final receivedCardController =
        moduleController.currentModule.value == Module.card
            ? Get.find<ReceivedCardController>()
            : null;
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
                  if (moduleController.currentModule.value == Module.card)
                    Card(
                      elevation: 0,
                      child: GestureDetector(
                        onTap: () {
                          cardController?.fetchDeletedAndArchivedCards();
                          GoRouter.of(context)
                              .pushNamed(Routes.archivedCardScreen);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3.h),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
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
                  kWidth10,
                  if (moduleController.currentModule.value == Module.card)
                    Card(
                      elevation: 0,
                      child: GestureDetector(
                        onTap: () {
                          cardController?.fetchDeletedAndArchivedCards();
                          receivedCardController
                              ?.fetchAllDeletedVisitingCards();
                          GoRouter.of(context)
                              .pushNamed(Routes.deletedCardScreen);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3.h),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
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
                  kWidth10,
                  // Obx(() => buildSwitch("Enable Local Save Option",
                  //         profileController.isBizCardStorageEnabled.value,
                  //         (value) {
                  //       profileController.isBizCardStorageEnabled.value = value;
                  //       profileController.saveBizCardStoragePreference();
                  //     })),

                  Card(
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.enbaleLocalDbScreen);
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
                                  'Enable Local Save Option',
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
                  kWidth10,
                  Card(
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.clearAllLocalDbData);
                        // showConfirmationDialog(
                        //   actionButton: 'Clear All',
                        //   heading: 'Are you sure want to Clear All Local Data',
                        //   context,
                        //   onPressed: () {
                        //     profileController.deleteAllDataFromLocal(context);
                        //   },
                        // );
                        // cardController.fetchDeletedAndArchivedCards();
                        // receivedCardController.fetchAllDeletedVisitingCards();
                        // GoRouter.of(context)
                        //     .pushNamed(Routes.deletedCardScreen);
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
                                  'Manage Local Storage',
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

  Widget buildSwitch(
    String label,
    bool? value,
    Function(bool) onChanged, [
    Color color = textFieldFillColr,
    BoxBorder? border,
  ]) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
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
                  label,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                ),
              ),
              Switch(
                inactiveTrackColor: kblack,
                inactiveThumbColor: value == null ? kblack : kwhite,
                trackOutlineColor: WidgetStatePropertyAll(value == null
                    ? kgrey
                    : value
                        ? kneon
                        : kwhite),
                activeTrackColor: color == kneon ? kwhite : kneon,
                activeColor: color == kneon ? kneon : kwhite,
                value: value ?? false,
                onChanged: (data) {
                  if (value != null) {
                    onChanged(data);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
