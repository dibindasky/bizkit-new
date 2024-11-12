import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
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
import 'package:go_router/go_router.dart';

class BizCardLevelSharingScreen extends StatefulWidget {
  const BizCardLevelSharingScreen(
      {super.key, this.isCommonLevelSharing = false});

  final bool isCommonLevelSharing;

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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 19,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    widget.isCommonLevelSharing
                        ? 'Common Level Sharing'
                        : 'Card Level Sharing',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kneon,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(23)),
                ),
                child: TabBar(
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
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    children: [
                      widget.isCommonLevelSharing
                          ? kempty
                          : buildSwitch(
                              "Personal Details",
                              levelSharingController
                                  .individualPersonalDetails.value,
                              (value) {
                                levelSharingController
                                    .changeindividualPersonalDetails(value);

                                if (!levelSharingController
                                    .individualPersonalDetails.value) {
                                  levelSharingController
                                      .changePersonalSharedFields(
                                    isCommonBusinessSharedField:
                                        widget.isCommonLevelSharing,
                                    individualPersonalSharedFields:
                                        levelSharingController
                                            .individualPersonalSharedFields
                                            .value
                                            .copyWith(
                                                name: false,
                                                bloodGroup: false,
                                                dob: false,
                                                email: false,
                                                personalAchievements: false,
                                                personalSocialMedia: false,
                                                phone: false),
                                  );
                                  levelSharingController
                                      .individualPersonalDetails.value = false;
                                }
                              },
                            ),
                      if (widget.isCommonLevelSharing)
                        buildSwitch(
                            "Name",
                            levelSharingController
                                    .personalSharedFields.value.name ??
                                false, (value) {
                          levelSharingController.changePersonalSharedFields(
                              isCommonBusinessSharedField:
                                  widget.isCommonLevelSharing,
                              commonPersonalSharedFields: levelSharingController
                                  .personalSharedFields.value
                                  .copyWith(name: value));
                        })
                      else
                        buildSwitch(
                            "Name",
                            levelSharingController
                                    .individualPersonalSharedFields
                                    .value
                                    .name ??
                                false, (value) {
                          if (levelSharingController
                              .individualPersonalDetails.value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField:
                                    widget.isCommonLevelSharing,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(name: value));
                          }
                        }),
                      widget.isCommonLevelSharing
                          ? buildSwitch(
                              "Email",
                              levelSharingController
                                      .personalSharedFields.value.email ??
                                  false, (value) {
                              levelSharingController.changePersonalSharedFields(
                                  isCommonBusinessSharedField:
                                      widget.isCommonLevelSharing,
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(email: value));
                            })
                          : buildSwitch(
                              "Email",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .email ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
                                                .copyWith(email: value));
                              }
                            }),
                      widget.isCommonLevelSharing
                          ? buildSwitch(
                              "Phone number",
                              levelSharingController
                                      .personalSharedFields.value.phone ??
                                  false, (value) {
                              levelSharingController.changePersonalSharedFields(
                                  isCommonBusinessSharedField:
                                      widget.isCommonLevelSharing,
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(phone: value));
                            })
                          : buildSwitch(
                              "Phone Number",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .phone ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
                                                .copyWith(phone: value));
                              }
                            }),
                      widget.isCommonLevelSharing
                          ? buildSwitch(
                              "Personal social medias",
                              levelSharingController.personalSharedFields.value
                                      .personalSocialMedia ??
                                  false, (value) {
                              levelSharingController.changePersonalSharedFields(
                                  isCommonBusinessSharedField:
                                      widget.isCommonLevelSharing,
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(
                                              personalSocialMedia: value));
                            })
                          : buildSwitch(
                              "Personal social medias",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .personalSocialMedia ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
                                                .copyWith(
                                                    personalSocialMedia:
                                                        value));
                              }
                            }),
                      widget.isCommonLevelSharing
                          ? buildSwitch(
                              "Personal achievements",
                              levelSharingController.personalSharedFields.value
                                      .personalAchievements ??
                                  false, (value) {
                              levelSharingController.changePersonalSharedFields(
                                  isCommonBusinessSharedField:
                                      widget.isCommonLevelSharing,
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(
                                              personalAchievements: value));
                            })
                          : buildSwitch(
                              "Personal achievements",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .personalAchievements ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
                                                .copyWith(
                                                    personalAchievements:
                                                        value));
                              }
                            }),
                      widget.isCommonLevelSharing
                          ? buildSwitch(
                              "Date of birth ",
                              levelSharingController
                                      .personalSharedFields.value.dob ??
                                  false, (value) {
                              levelSharingController.changePersonalSharedFields(
                                  isCommonBusinessSharedField:
                                      widget.isCommonLevelSharing,
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(dob: value));
                            })
                          : buildSwitch(
                              "Date of birth ",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .dob ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
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
                                  commonPersonalSharedFields:
                                      levelSharingController
                                          .personalSharedFields.value
                                          .copyWith(bloodGroup: value));
                            })
                          : buildSwitch(
                              "Blood group",
                              levelSharingController
                                      .individualPersonalSharedFields
                                      .value
                                      .bloodGroup ??
                                  false, (value) {
                              if (levelSharingController
                                  .individualPersonalDetails.value) {
                                levelSharingController
                                    .changePersonalSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        individualPersonalSharedFields:
                                            levelSharingController
                                                .individualPersonalSharedFields
                                                .value
                                                .copyWith(bloodGroup: value));
                              }
                            }),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.isCommonLevelSharing
                            ? kempty
                            : buildSwitch(
                                "Business Details",
                                levelSharingController
                                    .individualBusinessDetails.value, (value) {
                                levelSharingController
                                    .changeIndividualBusinessDetails(value);
                                if (!levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(
                                                      logoStory: false,
                                                      branchOffices: false,
                                                      brochure: false,
                                                      businessAchievements:
                                                          false,
                                                      businessCategory: false,
                                                      businessLogo: false,
                                                      businessSocialMedia:
                                                          false,
                                                      designation: false,
                                                      product: false));
                                  levelSharingController
                                      .individualBusinessDetails.value = false;
                                }
                              }, neonShade),
                        adjustHieght(5),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Business category",
                                levelSharingController.businessSharedFields
                                        .value.businessCategory ??
                                    false, (value) {
                                levelSharingController
                                    .changeBusinessSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        commonBusinessSharedFields:
                                            levelSharingController
                                                .businessSharedFields.value
                                                .copyWith(
                                                    businessCategory: value));
                              })
                            : buildSwitch(
                                "Business category",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .businessCategory ??
                                    false, (value) {
                                if (levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(
                                                      businessCategory: value));
                                }
                              }),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Designation",
                                levelSharingController.businessSharedFields
                                        .value.designation ??
                                    false, (value) {
                                levelSharingController
                                    .changeBusinessSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        commonBusinessSharedFields:
                                            levelSharingController
                                                .businessSharedFields.value
                                                .copyWith(designation: value));
                              })
                            : buildSwitch(
                                "Designation",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .designation ??
                                    false, (value) {
                                if (levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(
                                                      designation: value));
                                }
                              }),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Product",
                                levelSharingController
                                        .businessSharedFields.value.product ??
                                    false, (value) {
                                levelSharingController
                                    .changeBusinessSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        commonBusinessSharedFields:
                                            levelSharingController
                                                .businessSharedFields.value
                                                .copyWith(product: value));
                              })
                            : buildSwitch(
                                "Product",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .product ??
                                    false, (value) {
                                if (levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(product: value));
                                }
                              }),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Business achievements",
                                levelSharingController.businessSharedFields
                                        .value.businessAchievements ??
                                    false, (value) {
                                levelSharingController
                                    .changeBusinessSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        commonBusinessSharedFields:
                                            levelSharingController
                                                .businessSharedFields.value
                                                .copyWith(
                                                    businessAchievements:
                                                        value));
                              })
                            : buildSwitch(
                                "Business achievements",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .businessAchievements ??
                                    false, (value) {
                                if (levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(
                                                      businessAchievements:
                                                          value));
                                }
                              }),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Business social medias",
                                levelSharingController.businessSharedFields
                                        .value.businessSocialMedia ??
                                    false, (value) {
                                levelSharingController
                                    .changeBusinessSharedFields(
                                        isCommonBusinessSharedField:
                                            widget.isCommonLevelSharing,
                                        commonBusinessSharedFields:
                                            levelSharingController
                                                .businessSharedFields.value
                                                .copyWith(
                                                    businessSocialMedia:
                                                        value));
                              })
                            : buildSwitch(
                                "Business Social Medias",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .businessSocialMedia ??
                                    false, (value) {
                                if (levelSharingController
                                    .individualBusinessDetails.value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          individualBusinessSharedFields:
                                              levelSharingController
                                                  .individualBusinessSharedFields
                                                  .value
                                                  .copyWith(
                                                      businessSocialMedia:
                                                          value));
                                }
                              }),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Branch offices",
                                levelSharingController.businessSharedFields
                                        .value.branchOffices ??
                                    false,
                                (value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          commonBusinessSharedFields:
                                              levelSharingController
                                                  .businessSharedFields.value
                                                  .copyWith(
                                                      branchOffices: value));
                                },
                              )
                            : buildSwitch(
                                "Branch offices",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .branchOffices ??
                                    false,
                                (value) {
                                  if (levelSharingController
                                      .individualBusinessDetails.value) {
                                    levelSharingController
                                        .changeBusinessSharedFields(
                                            isCommonBusinessSharedField:
                                                widget.isCommonLevelSharing,
                                            individualBusinessSharedFields:
                                                levelSharingController
                                                    .individualBusinessSharedFields
                                                    .value
                                                    .copyWith(
                                                        branchOffices: value));
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
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          commonBusinessSharedFields:
                                              levelSharingController
                                                  .businessSharedFields.value
                                                  .copyWith(brochure: value));
                                },
                              )
                            : buildSwitch(
                                "Brochure",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .brochure ??
                                    false,
                                (value) {
                                  if (levelSharingController
                                      .individualBusinessDetails.value) {
                                    levelSharingController
                                        .changeBusinessSharedFields(
                                            isCommonBusinessSharedField:
                                                widget.isCommonLevelSharing,
                                            individualBusinessSharedFields:
                                                levelSharingController
                                                    .individualBusinessSharedFields
                                                    .value
                                                    .copyWith(brochure: value));
                                  }
                                },
                              ),
                        widget.isCommonLevelSharing
                            ? buildSwitch(
                                "Business logo",
                                levelSharingController.businessSharedFields
                                        .value.businessLogo ??
                                    false,
                                (value) {
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          commonBusinessSharedFields:
                                              levelSharingController
                                                  .businessSharedFields.value
                                                  .copyWith(
                                                      businessLogo: value));
                                },
                              )
                            : buildSwitch(
                                "Business logo",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .businessLogo ??
                                    false,
                                (value) {
                                  if (levelSharingController
                                      .individualBusinessDetails.value) {
                                    levelSharingController
                                        .changeBusinessSharedFields(
                                            isCommonBusinessSharedField:
                                                widget.isCommonLevelSharing,
                                            individualBusinessSharedFields:
                                                levelSharingController
                                                    .individualBusinessSharedFields
                                                    .value
                                                    .copyWith(
                                                        businessLogo: value));
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
                                  levelSharingController
                                      .changeBusinessSharedFields(
                                          isCommonBusinessSharedField:
                                              widget.isCommonLevelSharing,
                                          commonBusinessSharedFields:
                                              levelSharingController
                                                  .businessSharedFields.value
                                                  .copyWith(logoStory: value));
                                },
                              )
                            : buildSwitch(
                                "Logo story",
                                levelSharingController
                                        .individualBusinessSharedFields
                                        .value
                                        .logoStory ??
                                    false,
                                (value) {
                                  if (levelSharingController
                                      .individualBusinessDetails.value) {
                                    levelSharingController
                                        .changeBusinessSharedFields(
                                            isCommonBusinessSharedField:
                                                widget.isCommonLevelSharing,
                                            individualBusinessSharedFields:
                                                levelSharingController
                                                    .individualBusinessSharedFields
                                                    .value
                                                    .copyWith(
                                                        logoStory: value));
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            adjustHieght(20.h),
            widget.isCommonLevelSharing
                ? buildSwitch(
                    "Apply to all",
                    levelSharingController.commonLevelSharedFields.value
                            .applicableToIndividual ??
                        false, (value) {
                    levelSharingController
                        .changeComSharingApplicableToIndividual(
                            applicableToIndividual: levelSharingController
                                .commonLevelSharedFields.value
                                .copyWith(applicableToIndividual: value));
                  })
                : kempty,
            adjustHieght(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: EventButton(
                wdth: kwidth,
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
                        bizcardId: levelSharingController.selectedCardId.value,
                      ),
                    );
                  }
                },
              ),
            ),
            adjustHieght(khieght * .05),
          ],
        ),
      ),
    );
  }

  Widget buildSwitch(String label, bool? value, Function(bool) onChanged,
      [Color color = textFieldFillColr]) {
    // final levelSharingController = Get.find<LevelSharingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
