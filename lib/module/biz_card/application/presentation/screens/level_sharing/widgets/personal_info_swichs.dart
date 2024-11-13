import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalInfoSwitchs extends StatefulWidget {
  const PersonalInfoSwitchs({super.key, required this.isCommonLevelSharing});

  final bool isCommonLevelSharing;

  @override
  State<PersonalInfoSwitchs> createState() => _PersonalInfoSwichsState();
}

class _PersonalInfoSwichsState extends State<PersonalInfoSwitchs> {
  @override
  build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    return Column(
      children: [
        widget.isCommonLevelSharing
            ? kempty
            : buildSwitch(
                "Personal Details",
                levelSharingController.individualPersonalDetails.value,
                (value) {
                  levelSharingController.changeindividualPersonalDetails(value);

                  if (!levelSharingController.individualPersonalDetails.value) {
                    levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(
                              name: false,
                              bloodGroup: false,
                              dob: false,
                              email: false,
                              personalAchievements: false,
                              personalSocialMedia: false,
                              phone: false),
                    );
                    levelSharingController.individualPersonalDetails.value =
                        false;
                  }
                },
              ),
        adjustHieght(20.h),
        if (widget.isCommonLevelSharing)
          buildSwitch("Name",
              levelSharingController.personalSharedFields.value.name ?? false,
              (value) {
            levelSharingController.changePersonalSharedFields(
                isCommonBusinessSharedField: widget.isCommonLevelSharing,
                commonPersonalSharedFields: levelSharingController
                    .personalSharedFields.value
                    .copyWith(name: value));
          })
        else
          buildSwitch(
              "Name",
              levelSharingController
                      .individualPersonalSharedFields.value.name ??
                  false, (value) {
            if (levelSharingController.individualPersonalDetails.value) {
              levelSharingController.changePersonalSharedFields(
                  isCommonBusinessSharedField: widget.isCommonLevelSharing,
                  individualPersonalSharedFields: levelSharingController
                      .individualPersonalSharedFields.value
                      .copyWith(name: value));
            }
          }),
        widget.isCommonLevelSharing
            ? buildSwitch(
                "Email",
                levelSharingController.personalSharedFields.value.email ??
                    false, (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(email: value));
              })
            : buildSwitch(
                "Email",
                levelSharingController
                        .individualPersonalSharedFields.value.email ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(email: value));
                }
              }),
        widget.isCommonLevelSharing
            ? buildSwitch(
                "Phone number",
                levelSharingController.personalSharedFields.value.phone ??
                    false, (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(phone: value));
              })
            : buildSwitch(
                "Phone Number",
                levelSharingController
                        .individualPersonalSharedFields.value.phone ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(phone: value));
                }
              }),
        widget.isCommonLevelSharing
            ? buildSwitch(
                "Personal social medias",
                levelSharingController
                        .personalSharedFields.value.personalSocialMedia ??
                    false, (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(personalSocialMedia: value));
              })
            : buildSwitch(
                "Personal social medias",
                levelSharingController.individualPersonalSharedFields.value
                        .personalSocialMedia ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(personalSocialMedia: value));
                }
              }),
        widget.isCommonLevelSharing
            ? buildSwitch(
                "Personal achievements",
                levelSharingController
                        .personalSharedFields.value.personalAchievements ??
                    false, (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(personalAchievements: value));
              })
            : buildSwitch(
                "Personal achievements",
                levelSharingController.individualPersonalSharedFields.value
                        .personalAchievements ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(personalAchievements: value));
                }
              }),
        widget.isCommonLevelSharing
            ? buildSwitch("Date of birth ",
                levelSharingController.personalSharedFields.value.dob ?? false,
                (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(dob: value));
              })
            : buildSwitch(
                "Date of birth ",
                levelSharingController
                        .individualPersonalSharedFields.value.dob ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(dob: value));
                }
              }),
        widget.isCommonLevelSharing
            ? buildSwitch(
                "Blood group",
                levelSharingController.personalSharedFields.value.bloodGroup ??
                    false, (value) {
                levelSharingController.changePersonalSharedFields(
                    isCommonBusinessSharedField: widget.isCommonLevelSharing,
                    commonPersonalSharedFields: levelSharingController
                        .personalSharedFields.value
                        .copyWith(bloodGroup: value));
              })
            : buildSwitch(
                "Blood group",
                levelSharingController
                        .individualPersonalSharedFields.value.bloodGroup ??
                    false, (value) {
                if (levelSharingController.individualPersonalDetails.value) {
                  levelSharingController.changePersonalSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      individualPersonalSharedFields: levelSharingController
                          .individualPersonalSharedFields.value
                          .copyWith(bloodGroup: value));
                }
              }),
      ],
    );
  }

  Widget buildSwitch(
    String label,
    bool? value,
    Function(bool) onChanged, [
    Color color = textFieldFillColr,
    BoxBorder? border,
  ]) {
    // final levelSharingController = Get.find<LevelSharingController>();
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
