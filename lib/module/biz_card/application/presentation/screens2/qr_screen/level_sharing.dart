import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenCardLevelSharing extends StatelessWidget {
  const ScreenCardLevelSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Level Sharing',
          style: appBarHeading1,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                adjustHieght(khieght * .03),
                const SwitchButtons(),
                adjustHieght(khieght * .02),
                EventButton(
                  width: 100,
                  text: 'Save',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                adjustHieght(khieght * .04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchButtons extends StatefulWidget {
  const SwitchButtons({super.key});

  @override
  State<SwitchButtons> createState() => _SwitchButtonsState();
}

class _SwitchButtonsState extends State<SwitchButtons> {
  bool personalDetals = true;
  bool businessDetals = true;

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    return Obx(
      () => Column(
        children: [
          buildSwitch("Personal Details", personalDetals, (value) {
            setState(() {
              personalDetals = value;
              // If "Personal Details" is false, disable other switches
              if (!value) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(
                //       email: context.read<QrBloc>().createQrModel.email == null
                //           ? null
                //           : false,
                //       phoneNumber:
                //           context.read<QrBloc>().createQrModel.phoneNumber == null
                //               ? null
                //               : false,
                //       personalSocialMedia: context
                //                   .read<QrBloc>()
                //                   .createQrModel
                //                   .personalSocialMedia ==
                //               null
                //           ? null
                //           : false,
                //       accolades:
                //           context.read<QrBloc>().createQrModel.accolades == null
                //               ? null
                //               : false,
                //     );
              }
            });
          }, neonShade),
          adjustHieght(17),
          buildSwitch(
              "Name",
              levelSharingController
                      .individualPersonalSharedFields.value.name ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.company = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(company: value);
            });
          }),
          buildSwitch(
              "Email",
              levelSharingController
                      .individualPersonalSharedFields.value.email ??
                  false, (value) {
            setState(() {
              if (personalDetals) {
                // context.read<QrBloc>().createQrModel =
                //     context.read<QrBloc>().createQrModel.copyWith(email: value);
              }
            });
          }),
          buildSwitch(
              "Phone Number",
              levelSharingController
                      .individualPersonalSharedFields.value.phone ??
                  false, (value) {
            setState(() {
              if (personalDetals) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(phoneNumber: value);
              }
            });
          }),
          buildSwitch(
              "Personal social medias",
              levelSharingController.individualPersonalSharedFields.value
                      .personalSocialMedia ??
                  false, (value) {
            setState(() {
              if (personalDetals) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(personalSocialMedia: value);
              }
            });
          }),
          buildSwitch(
              "Personal achievements",
              levelSharingController.individualPersonalSharedFields.value
                      .personalAchievements ??
                  false, (value) {
            setState(() {
              if (personalDetals) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(accolades: value);
              }
            });
          }),
          buildSwitch(
              "Date of birth ",
              levelSharingController.individualPersonalSharedFields.value.dob ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.personalSocialMedia = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(personalSocialMedia: value);
            });
          }),
          buildSwitch(
              "Blood group",
              levelSharingController
                      .individualPersonalSharedFields.value.bloodGroup ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.personalSocialMedia = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(personalSocialMedia: value);
            });
          }),
          adjustHieght(khieght * .02),
          buildSwitch("Business Details", businessDetals, (value) {
            setState(() {
              businessDetals = value;
              // If "Busiess Details" is false, disable other switches
              if (!value) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(
                //       address:
                //           context.read<QrBloc>().createQrModel.address == null
                //               ? null
                //               : false,
                //       socialMediaHandles: context
                //                   .read<QrBloc>()
                //                   .createQrModel
                //                   .socialMediaHandles ==
                //               null
                //           ? null
                //           : false,
                //       businessDetailsMobileNumber: context
                //                   .read<QrBloc>()
                //                   .createQrModel
                //                   .businessDetailsMobileNumber ==
                //               null
                //           ? null
                //           : false,
                //       businessEmail:
                //           context.read<QrBloc>().createQrModel.businessEmail ==
                //                   null
                //               ? null
                //               : false,
                //       websiteLink:
                //           context.read<QrBloc>().createQrModel.websiteLink == null
                //               ? null
                //               : false,
                //       accreditation:
                //           context.read<QrBloc>().createQrModel.accreditation ==
                //                   null
                //               ? null
                //               : false,
                //       company:
                //           context.read<QrBloc>().createQrModel.company == null
                //               ? null
                //               : false,
                //     );
              }
            });
          }, neonShade),
          adjustHieght(5),
          buildSwitch(
              "Business category",
              levelSharingController
                      .individualBusinessSharedFields.value.businessCategory ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.businessDetailsMobileNumber = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(businessDetailsMobileNumber: value);
            });
          }),
          buildSwitch(
              "Designation",
              levelSharingController
                      .individualBusinessSharedFields.value.designation ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.businessEmail = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(businessEmail: value);
            });
          }),
          buildSwitch(
              "Product",
              levelSharingController
                      .individualBusinessSharedFields.value.product ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.websiteLink = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(websiteLink: value);
            });
          }),
          buildSwitch(
              "Business achievements",
              levelSharingController.individualBusinessSharedFields.value
                      .businessAchievements ??
                  false, (value) {
            // setState(() {
            //   state.defauiltQr!.address = value;
            //   context.read<QrBloc>().defauiltQr =
            //       context.read<QrBloc>().defauiltQr.copyWith(address: value);
            // });
          }),
          buildSwitch(
              "Business Social Medias",
              levelSharingController.individualBusinessSharedFields.value
                      .businessSocialMedia ??
                  false, (value) {
            setState(() {
              if (businessDetals) {
                // context.read<QrBloc>().createQrModel = context
                //     .read<QrBloc>()
                //     .createQrModel
                //     .copyWith(socialMediaHandles: value);
              }
            });
          }),
          buildSwitch(
            "Branch offices",
            levelSharingController
                    .individualBusinessSharedFields.value.branchOffices ??
                false,
            (value) {
              // setState(() {
              //   state.defauiltQr!.accreditation = value;
              //   context.read<QrBloc>().defauiltQr = context
              //       .read<QrBloc>()
              //       .defauiltQr
              //       .copyWith(accreditation: value);
              // });
            },
          ),
          buildSwitch(
            "Brochure",
            levelSharingController
                    .individualBusinessSharedFields.value.brochure ??
                false,
            (value) {
              // setState(() {
              //   state.defauiltQr!.accreditation = value;
              //   context.read<QrBloc>().defauiltQr = context
              //       .read<QrBloc>()
              //       .defauiltQr
              //       .copyWith(accreditation: value);
              // });
            },
          ),
          buildSwitch(
            "Business logo",
            levelSharingController
                    .individualBusinessSharedFields.value.businessLogo ??
                false,
            (value) {
              // setState(() {
              //   state.defauiltQr!.accreditation = value;
              //   context.read<QrBloc>().defauiltQr = context
              //       .read<QrBloc>()
              //       .defauiltQr
              //       .copyWith(accreditation: value);
              // });
            },
          ),
          buildSwitch(
            "Logo story",
            levelSharingController
                    .individualBusinessSharedFields.value.logoStory ??
                false,
            (value) {
              levelSharingController.individualBusinessSharedFields.value
                  .copyWith(logoStory: value);

              // setState(() {
              //   state.defauiltQr!.accreditation = value;
              //   context.read<QrBloc>().defauiltQr = context
              //       .read<QrBloc>()
              //       .defauiltQr
              //       .copyWith(accreditation: value);
              // });
            },
          ),
        ],
      ),
    );
  }

  Widget buildSwitch(String label, bool? value, Function(bool) onChanged,
      [Color color = textFieldFillColr]) {
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
