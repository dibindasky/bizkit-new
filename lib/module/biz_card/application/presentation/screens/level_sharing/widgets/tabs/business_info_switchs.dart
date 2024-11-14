import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusinessInfoSwitchs extends StatefulWidget {
  const BusinessInfoSwitchs({super.key, required this.isCommonLevelSharing});

  final bool isCommonLevelSharing;

  @override
  State<BusinessInfoSwitchs> createState() => _BusinessInfoSwitchsState();
}

class _BusinessInfoSwitchsState extends State<BusinessInfoSwitchs> {
  @override
  build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();

    return SingleChildScrollView(
        child: Obx(
      () => Column(
        children: [
          widget.isCommonLevelSharing
              ? kempty
              : buildSwitch(
                  "Business Details",
                  levelSharingController.individualBusinessDetails.value,
                  (value) {
                    levelSharingController
                        .changeIndividualBusinessDetails(value);
                    if (!levelSharingController
                        .individualBusinessDetails.value) {
                      levelSharingController.changeBusinessSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualBusinessSharedFields: levelSharingController
                              .individualBusinessSharedFields.value
                              .copyWith(
                                  logoStory: false,
                                  branchOffices: false,
                                  brochure: false,
                                  businessAchievements: false,
                                  businessCategory: false,
                                  businessLogo: false,
                                  businessSocialMedia: false,
                                  designation: false,
                                  product: false));
                      levelSharingController.individualBusinessDetails.value =
                          false;
                    }
                  },
                  textFieldFillColr,
                  Border.all(color: Theme.of(context).colorScheme.onPrimary),
                ),
          adjustHieght(20.h),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Business category",
                  levelSharingController
                          .businessSharedFields.value.businessCategory ??
                      false, (value) {
                  levelSharingController.changeBusinessSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      commonBusinessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(businessCategory: value));
                })
              : buildSwitch(
                  "Business category",
                  levelSharingController.individualBusinessSharedFields.value
                          .businessCategory ??
                      false, (value) {
                  if (levelSharingController.individualBusinessDetails.value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        individualBusinessSharedFields: levelSharingController
                            .individualBusinessSharedFields.value
                            .copyWith(businessCategory: value));
                  }
                }),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Designation",
                  levelSharingController
                          .businessSharedFields.value.designation ??
                      false, (value) {
                  levelSharingController.changeBusinessSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      commonBusinessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(designation: value));
                })
              : buildSwitch(
                  "Designation",
                  levelSharingController
                          .individualBusinessSharedFields.value.designation ??
                      false, (value) {
                  if (levelSharingController.individualBusinessDetails.value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        individualBusinessSharedFields: levelSharingController
                            .individualBusinessSharedFields.value
                            .copyWith(designation: value));
                  }
                }),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Product",
                  levelSharingController.businessSharedFields.value.product ??
                      false, (value) {
                  levelSharingController.changeBusinessSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      commonBusinessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(product: value));
                })
              : buildSwitch(
                  "Product",
                  levelSharingController
                          .individualBusinessSharedFields.value.product ??
                      false, (value) {
                  if (levelSharingController.individualBusinessDetails.value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        individualBusinessSharedFields: levelSharingController
                            .individualBusinessSharedFields.value
                            .copyWith(product: value));
                  }
                }),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Business achievements",
                  levelSharingController
                          .businessSharedFields.value.businessAchievements ??
                      false, (value) {
                  levelSharingController.changeBusinessSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      commonBusinessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(businessAchievements: value));
                })
              : buildSwitch(
                  "Business achievements",
                  levelSharingController.individualBusinessSharedFields.value
                          .businessAchievements ??
                      false, (value) {
                  if (levelSharingController.individualBusinessDetails.value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        individualBusinessSharedFields: levelSharingController
                            .individualBusinessSharedFields.value
                            .copyWith(businessAchievements: value));
                  }
                }),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Business social medias",
                  levelSharingController
                          .businessSharedFields.value.businessSocialMedia ??
                      false, (value) {
                  levelSharingController.changeBusinessSharedFields(
                      isCommonBusinessSharedField: widget.isCommonLevelSharing,
                      commonBusinessSharedFields: levelSharingController
                          .businessSharedFields.value
                          .copyWith(businessSocialMedia: value));
                })
              : buildSwitch(
                  "Business Social Medias",
                  levelSharingController.individualBusinessSharedFields.value
                          .businessSocialMedia ??
                      false, (value) {
                  if (levelSharingController.individualBusinessDetails.value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        individualBusinessSharedFields: levelSharingController
                            .individualBusinessSharedFields.value
                            .copyWith(businessSocialMedia: value));
                  }
                }),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Branch offices",
                  levelSharingController
                          .businessSharedFields.value.branchOffices ??
                      false,
                  (value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(branchOffices: value));
                  },
                )
              : buildSwitch(
                  "Branch offices",
                  levelSharingController
                          .individualBusinessSharedFields.value.branchOffices ??
                      false,
                  (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
                      levelSharingController.changeBusinessSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualBusinessSharedFields: levelSharingController
                              .individualBusinessSharedFields.value
                              .copyWith(branchOffices: value));
                    }
                  },
                ),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Brochure",
                  levelSharingController.businessSharedFields.value.brochure ??
                      false,
                  (value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(brochure: value));
                  },
                )
              : buildSwitch(
                  "Brochure",
                  levelSharingController
                          .individualBusinessSharedFields.value.brochure ??
                      false,
                  (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
                      levelSharingController.changeBusinessSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualBusinessSharedFields: levelSharingController
                              .individualBusinessSharedFields.value
                              .copyWith(brochure: value));
                    }
                  },
                ),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Business logo",
                  levelSharingController
                          .businessSharedFields.value.businessLogo ??
                      false,
                  (value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(businessLogo: value));
                  },
                )
              : buildSwitch(
                  "Business logo",
                  levelSharingController
                          .individualBusinessSharedFields.value.businessLogo ??
                      false,
                  (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
                      levelSharingController.changeBusinessSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualBusinessSharedFields: levelSharingController
                              .individualBusinessSharedFields.value
                              .copyWith(businessLogo: value));
                    }
                  },
                ),
          widget.isCommonLevelSharing
              ? buildSwitch(
                  "Logo story",
                  levelSharingController.businessSharedFields.value.logoStory ??
                      false,
                  (value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(logoStory: value));
                  },
                )
              : buildSwitch(
                  "Logo story",
                  levelSharingController
                          .individualBusinessSharedFields.value.logoStory ??
                      false,
                  (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
                      levelSharingController.changeBusinessSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualBusinessSharedFields: levelSharingController
                              .individualBusinessSharedFields.value
                              .copyWith(logoStory: value));
                    }
                  },
                ),
        ],
      ),
    ));
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
