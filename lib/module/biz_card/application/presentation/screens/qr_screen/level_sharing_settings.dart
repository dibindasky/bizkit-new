import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        //context.read<QrBloc>().add(const QrEvent.getDefaultQr());
      },
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
              // Container(
              //   height: 80,
              //   padding: const EdgeInsets.only(left: 15, right: 10),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: kwhite),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Text(
              //               'Commen Level Sharing',
              //               style: TextStyle(fontSize: kwidth * 0.037),
              //             )
              //           ]),
              //       const Icon(Icons.keyboard_arrow_down_outlined,
              //           color: kwhite, size: 30)
              //     ],
              //   ),
              // ),
              adjustHieght(khieght * .04),
              const DefaultSwitchButtons(),
              adjustHieght(khieght * .05),
              EventButton(
                  text: 'Save',
                  onTap: () {
                    // context.read<QrBloc>().add(QrEvent.defaultQr(
                    //     defauiltQr: context.read<QrBloc>().defauiltQr));

                    Navigator.pop(context);
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
            setState(() {
              // state.defauiltQr!.company = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(company: value);
            });
          }),
          buildSwitch("Email",
              levelSharingController.personalSharedFields.value.email ?? false,
              (value) {
            setState(() {
              //state.defauiltQr!.email = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(email: value);
            });
          }),
          buildSwitch("Phone number",
              levelSharingController.personalSharedFields.value.phone ?? false,
              (value) {
            setState(() {
              // state.defauiltQr!.phoneNumber = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(phoneNumber: value);
            });
          }),
          buildSwitch(
              "Personal social medias",
              levelSharingController
                      .personalSharedFields.value.personalSocialMedia ??
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
              "Personal achievements",
              levelSharingController
                      .personalSharedFields.value.personalAchievements ??
                  false, (value) {
            // setState(() {
            //   state.defauiltQr!.accolades = value;
            //   context.read<QrBloc>().defauiltQr =
            //       context.read<QrBloc>().defauiltQr.copyWith(accolades: value);
            // });
          }),
          buildSwitch("Date of birth ",
              levelSharingController.personalSharedFields.value.dob ?? false,
              (value) {
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
              levelSharingController.personalSharedFields.value.bloodGroup ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.personalSocialMedia = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(personalSocialMedia: value);
            });
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
              levelSharingController.businessSharedFields.value.designation ??
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
              levelSharingController.businessSharedFields.value.product ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.websiteLink = value;
              // context.read<QrBloc>().defauiltQr =
              //     context.read<QrBloc>().defauiltQr.copyWith(websiteLink: value);
            });
          }),
          buildSwitch(
              "Business achievements",
              levelSharingController
                      .businessSharedFields.value.businessAchievements ??
                  false, (value) {
            // setState(() {
            //   state.defauiltQr!.address = value;
            //   context.read<QrBloc>().defauiltQr =
            //       context.read<QrBloc>().defauiltQr.copyWith(address: value);
            // });
          }),
          buildSwitch(
              "Business social medias",
              levelSharingController
                      .businessSharedFields.value.businessSocialMedia ??
                  false, (value) {
            setState(() {
              // state.defauiltQr!.socialMediaHandles = value;
              // context.read<QrBloc>().defauiltQr = context
              //     .read<QrBloc>()
              //     .defauiltQr
              //     .copyWith(socialMediaHandles: value);
            });
          }),
          buildSwitch(
            "Branch offices",
            levelSharingController.businessSharedFields.value.branchOffices ??
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
            levelSharingController.businessSharedFields.value.brochure ?? false,
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
            levelSharingController.businessSharedFields.value.businessLogo ??
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
            levelSharingController.businessSharedFields.value.logoStory ??
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
          // adjustHieght(khieght * .03),
          // buildSwitch("Update all cards", false, (value) {
          //   setState(
          //     () {
          //       // state.defauiltQr!.updateAllCards = value;
          //       // context.read<QrBloc>().defauiltQr = context
          //       //     .read<QrBloc>()
          //       //     .defauiltQr
          //       //     .copyWith(updateAllCards: value);
          //     },
          //   );
          // }, wantShowDailogue: true),zz
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
