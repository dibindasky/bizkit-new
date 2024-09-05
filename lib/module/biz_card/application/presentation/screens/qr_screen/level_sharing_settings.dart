import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDefaultLevelSharing extends StatefulWidget {
  const CardDefaultLevelSharing({super.key});

  @override
  State<CardDefaultLevelSharing> createState() =>
      _CardDefaultLevelSharingState();
}

class _CardDefaultLevelSharingState extends State<CardDefaultLevelSharing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {},
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text('Commen level sharing settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              adjustHieght(khieght * .04),
              const DefaultSwitchButtons(),
              adjustHieght(khieght * .05),
              EventButton(
                  text: 'Save',
                  onTap: () {
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
                  }),
              adjustHieght(khieght * .03),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultSwitchButtons extends StatefulWidget {
  const DefaultSwitchButtons({super.key});

  @override
  State<DefaultSwitchButtons> createState() => _DefaultSwitchButtonsState();
}

class _DefaultSwitchButtonsState extends State<DefaultSwitchButtons> {
  bool personalDetals = true;
  bool businessDetals = true;

  @override
  void initState() {
    //context.read<QrBloc>().add(const QrEvent.getDefaultQr());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const SizedBox(
              width: double.infinity,
              child: ColoredBox(
                color: neonShade,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Personal Details"),
                ),
              ),
            ),
          ),
          adjustHieght(17),
          buildSwitch("Name",
              levelSharingController.personalSharedFields.value.name ?? false,
              (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(name: value));
          }),
          buildSwitch("Email",
              levelSharingController.personalSharedFields.value.email ?? false,
              (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(email: value));
          }),
          buildSwitch("Phone number",
              levelSharingController.personalSharedFields.value.phone ?? false,
              (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(phone: value));
          }),
          buildSwitch(
              "Personal social medias",
              levelSharingController
                      .personalSharedFields.value.personalSocialMedia ??
                  false, (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(personalSocialMedia: value));
          }),
          buildSwitch(
              "Personal achievements",
              levelSharingController
                      .personalSharedFields.value.personalAchievements ??
                  false, (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(personalAchievements: value));
          }),
          buildSwitch("Date of birth ",
              levelSharingController.personalSharedFields.value.dob ?? false,
              (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(dob: value));
          }),
          buildSwitch(
              "Blood group",
              levelSharingController.personalSharedFields.value.bloodGroup ??
                  false, (value) {
            levelSharingController.changePersonalCommonLevelSharing(
                personalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(bloodGroup: value));
          }),
          adjustHieght(5),
          adjustHieght(khieght * .02),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const SizedBox(
              width: double.infinity,
              child: ColoredBox(
                color: neonShade,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Business Details"),
                ),
              ),
            ),
          ),
          adjustHieght(17),
          buildSwitch(
              "Business category",
              levelSharingController
                      .businessSharedFields.value.businessCategory ??
                  false, (value) {
            levelSharingController.changeBusinessSharedFieldsCommonLevelSharing(
                businessSharedFields: levelSharingController
                    .businessSharedFields.value
                    .copyWith(businessCategory: value));
          }),
          buildSwitch(
              "Designation",
              levelSharingController.businessSharedFields.value.designation ??
                  false, (value) {
            levelSharingController.changeBusinessSharedFieldsCommonLevelSharing(
                businessSharedFields: levelSharingController
                    .businessSharedFields.value
                    .copyWith(designation: value));
          }),
          buildSwitch(
              "Product",
              levelSharingController.businessSharedFields.value.product ??
                  false, (value) {
            levelSharingController.changeBusinessSharedFieldsCommonLevelSharing(
                businessSharedFields: levelSharingController
                    .businessSharedFields.value
                    .copyWith(product: value));
          }),
          buildSwitch(
              "Business achievements",
              levelSharingController
                      .businessSharedFields.value.businessAchievements ??
                  false, (value) {
            levelSharingController.changeBusinessSharedFieldsCommonLevelSharing(
                businessSharedFields: levelSharingController
                    .businessSharedFields.value
                    .copyWith(businessAchievements: value));
          }),
          buildSwitch(
              "Business social medias",
              levelSharingController
                      .businessSharedFields.value.businessSocialMedia ??
                  false, (value) {
            levelSharingController.changeBusinessSharedFieldsCommonLevelSharing(
                businessSharedFields: levelSharingController
                    .businessSharedFields.value
                    .copyWith(businessSocialMedia: value));
          }),
          buildSwitch(
            "Branch offices",
            levelSharingController.businessSharedFields.value.branchOffices ??
                false,
            (value) {
              levelSharingController
                  .changeBusinessSharedFieldsCommonLevelSharing(
                      businessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(branchOffices: value));
            },
          ),
          buildSwitch(
            "Brochure",
            levelSharingController.businessSharedFields.value.brochure ?? false,
            (value) {
              levelSharingController
                  .changeBusinessSharedFieldsCommonLevelSharing(
                      businessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(brochure: value));
            },
          ),
          buildSwitch(
            "Business logo",
            levelSharingController.businessSharedFields.value.businessLogo ??
                false,
            (value) {
              levelSharingController
                  .changeBusinessSharedFieldsCommonLevelSharing(
                      businessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(businessLogo: value));
            },
          ),
          buildSwitch(
            "Logo story",
            levelSharingController.businessSharedFields.value.logoStory ??
                false,
            (value) {
              levelSharingController
                  .changeBusinessSharedFieldsCommonLevelSharing(
                      businessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(logoStory: value));
            },
          ),
          adjustHieght(khieght * .05),
          buildSwitch(
              "Applicable To Individual",
              levelSharingController
                      .commonLevelSharedFields.value.applicableToIndividual ??
                  false, (value) {
            levelSharingController.changeComSharingApplicableToIndividual(
                applicableToIndividual: levelSharingController
                    .commonLevelSharedFields.value
                    .copyWith(applicableToIndividual: value));
          }),
        ],
      ),
    );
  }

  Widget buildSwitch(String label, bool value, Function(bool) onChanged,
      {Color color = textFieldFillColr, bool wantShowDailogue = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: kwidth * 0.043,
                fontWeight: FontWeight.w600,
              ),
            ),
            Switch(
              inactiveTrackColor: textFieldFillColr,
              inactiveThumbColor: kwhite,
              activeTrackColor: color == neonShade ? kwhite : neonShade,
              activeColor: color == neonShade ? neonShade : kwhite,
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
