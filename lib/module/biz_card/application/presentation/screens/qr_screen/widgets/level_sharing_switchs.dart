import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchButtons extends StatefulWidget {
  const SwitchButtons({super.key, this.isCommonLevelSharing = false});

  final bool isCommonLevelSharing;

  @override
  State<SwitchButtons> createState() => _SwitchButtonsState();
}

class _SwitchButtonsState extends State<SwitchButtons> {
  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    return Obx(
      () {
        return Column(
          children: [
            widget.isCommonLevelSharing
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ColoredBox(
                        color: neonShade,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text("Personal Details"),
                        ),
                      ),
                    ),
                  )
                : buildSwitch("Personal Details",
                    levelSharingController.individualPersonalDetails.value,
                    (value) {
                    levelSharingController
                        .changeindividualPersonalDetails(value);

                    if (!levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
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
                  }, neonShade),
            adjustHieght(17),
            if (widget.isCommonLevelSharing)
              buildSwitch(
                  "Name",
                  levelSharingController.personalSharedFields.value.name ??
                      false, (value) {
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(email: value));
                  })
                : buildSwitch(
                    "Email",
                    levelSharingController
                            .individualPersonalSharedFields.value.email ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(phone: value));
                  })
                : buildSwitch(
                    "Phone Number",
                    levelSharingController
                            .individualPersonalSharedFields.value.phone ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(personalSocialMedia: value));
                  })
                : buildSwitch(
                    "Personal social medias",
                    levelSharingController.individualPersonalSharedFields.value
                            .personalSocialMedia ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(personalAchievements: value));
                  })
                : buildSwitch(
                    "Personal achievements",
                    levelSharingController.individualPersonalSharedFields.value
                            .personalAchievements ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualPersonalSharedFields: levelSharingController
                              .individualPersonalSharedFields.value
                              .copyWith(personalAchievements: value));
                    }
                  }),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Date of birth ",
                    levelSharingController.personalSharedFields.value.dob ??
                        false, (value) {
                    levelSharingController.changePersonalSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(dob: value));
                  })
                : buildSwitch(
                    "Date of birth ",
                    levelSharingController
                            .individualPersonalSharedFields.value.dob ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualPersonalSharedFields: levelSharingController
                              .individualPersonalSharedFields.value
                              .copyWith(dob: value));
                    }
                  }),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Blood group",
                    levelSharingController
                            .personalSharedFields.value.bloodGroup ??
                        false, (value) {
                    levelSharingController.changePersonalSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonPersonalSharedFields: levelSharingController
                            .personalSharedFields.value
                            .copyWith(bloodGroup: value));
                  })
                : buildSwitch(
                    "Blood group",
                    levelSharingController
                            .individualPersonalSharedFields.value.bloodGroup ??
                        false, (value) {
                    if (levelSharingController
                        .individualPersonalDetails.value) {
                      levelSharingController.changePersonalSharedFields(
                          isCommonBusinessSharedField:
                              widget.isCommonLevelSharing,
                          individualPersonalSharedFields: levelSharingController
                              .individualPersonalSharedFields.value
                              .copyWith(bloodGroup: value));
                    }
                  }),
            adjustHieght(khieght * .02),
            widget.isCommonLevelSharing
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ColoredBox(
                        color: neonShade,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text("Business Details"),
                        ),
                      ),
                    ),
                  )
                : buildSwitch("Business Details",
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
                  }, neonShade),
            adjustHieght(5),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Business category",
                    levelSharingController
                            .businessSharedFields.value.businessCategory ??
                        false, (value) {
                    levelSharingController.changeBusinessSharedFields(
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(businessCategory: value));
                  })
                : buildSwitch(
                    "Business category",
                    levelSharingController.individualBusinessSharedFields.value
                            .businessCategory ??
                        false, (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(designation: value));
                  })
                : buildSwitch(
                    "Designation",
                    levelSharingController
                            .individualBusinessSharedFields.value.designation ??
                        false, (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(product: value));
                  })
                : buildSwitch(
                    "Product",
                    levelSharingController
                            .individualBusinessSharedFields.value.product ??
                        false, (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(businessAchievements: value));
                  })
                : buildSwitch(
                    "Business achievements",
                    levelSharingController.individualBusinessSharedFields.value
                            .businessAchievements ??
                        false, (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
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
                        isCommonBusinessSharedField:
                            widget.isCommonLevelSharing,
                        commonBusinessSharedFields: levelSharingController
                            .businessSharedFields.value
                            .copyWith(businessSocialMedia: value));
                  })
                : buildSwitch(
                    "Business Social Medias",
                    levelSharingController.individualBusinessSharedFields.value
                            .businessSocialMedia ??
                        false, (value) {
                    if (levelSharingController
                        .individualBusinessDetails.value) {
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
                    levelSharingController.individualBusinessSharedFields.value
                            .branchOffices ??
                        false,
                    (value) {
                      if (levelSharingController
                          .individualBusinessDetails.value) {
                        levelSharingController.changeBusinessSharedFields(
                            isCommonBusinessSharedField:
                                widget.isCommonLevelSharing,
                            individualBusinessSharedFields:
                                levelSharingController
                                    .individualBusinessSharedFields.value
                                    .copyWith(branchOffices: value));
                      }
                    },
                  ),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Brochure",
                    levelSharingController
                            .businessSharedFields.value.brochure ??
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
                            individualBusinessSharedFields:
                                levelSharingController
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
                    levelSharingController.individualBusinessSharedFields.value
                            .businessLogo ??
                        false,
                    (value) {
                      if (levelSharingController
                          .individualBusinessDetails.value) {
                        levelSharingController.changeBusinessSharedFields(
                            isCommonBusinessSharedField:
                                widget.isCommonLevelSharing,
                            individualBusinessSharedFields:
                                levelSharingController
                                    .individualBusinessSharedFields.value
                                    .copyWith(businessLogo: value));
                      }
                    },
                  ),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Logo story",
                    levelSharingController
                            .businessSharedFields.value.logoStory ??
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
                            individualBusinessSharedFields:
                                levelSharingController
                                    .individualBusinessSharedFields.value
                                    .copyWith(logoStory: value));
                      }
                    },
                  ),
            if (widget.isCommonLevelSharing) adjustHieght(khieght * .05),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Applicable To Individual",
                    levelSharingController.commonLevelSharedFields.value
                            .applicableToIndividual ??
                        false, (value) {
                    levelSharingController
                        .changeComSharingApplicableToIndividual(
                            applicableToIndividual: levelSharingController
                                .commonLevelSharedFields.value
                                .copyWith(applicableToIndividual: value));
                  })
                : kempty
          ],
        );
      },
    );
  }

  Widget buildSwitch(String label, bool? value, Function(bool) onChanged,
      [Color color = textFieldFillColr]) {
    // final levelSharingController = Get.find<LevelSharingController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: value == null ? smallBigGrey : color,
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
                  color: value == null ? smallBigGrey : kwhite),
            ),
            Switch(
              inactiveTrackColor: textFieldFillColr,
              inactiveThumbColor: value == null ? kgrey : kwhite,
              trackOutlineColor: WidgetStatePropertyAll(value == null
                  ? kgrey
                  : value
                      ? neonShade
                      : kwhite),
              activeTrackColor: color == neonShade ? kwhite : neonShade,
              activeColor: color == neonShade ? neonShade : kwhite,
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
