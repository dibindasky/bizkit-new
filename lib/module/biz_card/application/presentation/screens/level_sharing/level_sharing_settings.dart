import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/level_sharing/widgets/level_sharing_app_bar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/level_sharing/widgets/tabs/business_info_switchs.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/level_sharing/widgets/tabs/personal_info_swichs.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/level_sharing/widgets/personl_business_tabs.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/shared_fields/shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BizCardLevelSharingScreen extends StatefulWidget {
  const BizCardLevelSharingScreen(
      {super.key, this.isCommonLevelSharing = false, this.bizcardId});

  final bool isCommonLevelSharing;
  final String? bizcardId;

  @override
  State<BizCardLevelSharingScreen> createState() =>
      _BizCardLevelSharingScreenState();
}

class _BizCardLevelSharingScreenState extends State<BizCardLevelSharingScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LevelSharingAppBar(
                isCommonLevelSharing: widget.isCommonLevelSharing),
            PersonalAndBusinessInfoTab(tabController: tabController),
            Obx(
              () {
                if (!widget.isCommonLevelSharing
                    ? levelSharingController.individualLevelSharingLoading.value
                    : levelSharingController.commonLevelSharingLoading.value) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        PersonalInfoSwitchs(
                            isCommonLevelSharing: widget.isCommonLevelSharing),
                        BusinessInfoSwitchs(
                            isCommonLevelSharing: widget.isCommonLevelSharing)
                      ],
                    ),
                  );
                }
              },
            ),
            adjustHieght(20.h),
            if (widget.isCommonLevelSharing)
              buildSwitch(
                  "Apply to all",
                  levelSharingController.commonLevelSharedFields.value
                          .applicableToIndividual ??
                      false, (value) {
                levelSharingController.changeComSharingApplicableToIndividual(
                    applicableToIndividual: levelSharingController
                        .commonLevelSharedFields.value
                        .copyWith(applicableToIndividual: value));
              }, textFieldFillColr,
                  Border.all(color: Theme.of(context).colorScheme.onPrimary)),
            adjustHieght(15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: EventButton(
                width: kwidth,
                color: const LinearGradient(colors: [kneon, kneon]),
                text: 'Save',
                textStyle: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 14),
                onTap: () {
                  if (widget.isCommonLevelSharing) {
                    levelSharingController.updateCommonSharedFields(
                      context: context,
                      updateCommonSharedFields: UpdateCommonSharedFieldsModel(
                        applicableToIndividual: levelSharingController
                                .commonLevelSharedFields
                                .value
                                .applicableToIndividual ??
                            false,
                        sharedFields: SharedFields(
                          business:
                              levelSharingController.businessSharedFields.value,
                          personal:
                              levelSharingController.personalSharedFields.value,
                        ),
                      ),
                    );
                  } else {
                    levelSharingController.updateIndividualSharedFields(
                      context: context,
                      updateIndividualSharedFields:
                          IndividualSharedFieldsResponce(
                        sharedFields: IndividualSharedFields(
                            business: levelSharingController
                                .individualBusinessSharedFields.value,
                            personal: levelSharingController
                                .individualPersonalSharedFields.value),
                        bizcardId: widget.bizcardId ?? '',
                      ),
                    );
                  }
                },
              ),
            ),
            adjustHieght(khieght * .04)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget buildSwitch(
    String label,
    bool? value,
    Function(bool) onChanged, [
    Color color = textFieldFillColr,
    BoxBorder? border,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.displaySmall,
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
    );
  }
}
