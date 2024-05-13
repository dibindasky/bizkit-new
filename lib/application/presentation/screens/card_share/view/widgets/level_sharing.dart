import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelSharing extends StatelessWidget {
  const LevelSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    height: 57.dm,
                    width: 300.dm,
                    decoration: BoxDecoration(
                      border: Border.all(color: kwhite),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Level Sharing',
                              style: TextStyle(fontSize: kwidth * 0.037),
                            ),
                            Text(
                              'Professional, Emergency, Company',
                              style: TextStyle(
                                fontSize: kwidth * 0.027,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: kwhite,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                adjustHieght(khieght * .04),
                const SwitchButtons(),
                adjustHieght(khieght * .02),
                AuthButton(
                  wdth: 100,
                  text: 'Save',
                  onTap: () {
                    context.read<QrBloc>().add(QrEvent.addNewLevelSharing(
                        createQrModel: context.read<QrBloc>().createQrModel));
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
    return Column(
      children: [
        buildSwitch("Personal Details", personalDetals, (value) {
          setState(() {
            personalDetals = value;
            // If "Personal Details" is false, disable other switches
            if (!value) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(
                    email: context.read<QrBloc>().createQrModel.email == null
                        ? null
                        : false,
                    phoneNumber:
                        context.read<QrBloc>().createQrModel.phoneNumber == null
                            ? null
                            : false,
                    personalSocialMedia: context
                                .read<QrBloc>()
                                .createQrModel
                                .personalSocialMedia ==
                            null
                        ? null
                        : false,
                    accolades:
                        context.read<QrBloc>().createQrModel.accolades == null
                            ? null
                            : false,
                  );
            }
          });
        }, neonShade),
        adjustHieght(5),
        buildSwitch("Email", context.read<QrBloc>().createQrModel.email,
            (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(email: value);
            }
          });
        }),
        buildSwitch(
            "Phone Number", context.read<QrBloc>().createQrModel.phoneNumber,
            (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(phoneNumber: value);
            }
          });
        }),
        buildSwitch("Personal Social Medias",
            context.read<QrBloc>().createQrModel.personalSocialMedia, (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(personalSocialMedia: value);
            }
          });
        }),
        buildSwitch("Personal Achievements",
            context.read<QrBloc>().createQrModel.accolades, (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(accolades: value);
            }
          });
        }),
        adjustHieght(khieght * .02),
        buildSwitch("Business Details", businessDetals, (value) {
          setState(() {
            businessDetals = value;
            // If "Busiess Details" is false, disable other switches
            if (!value) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(
                    address:
                        context.read<QrBloc>().createQrModel.address == null
                            ? null
                            : false,
                    socialMediaHandles: context
                                .read<QrBloc>()
                                .createQrModel
                                .socialMediaHandles ==
                            null
                        ? null
                        : false,
                    businessDetailsMobileNumber: context
                                .read<QrBloc>()
                                .createQrModel
                                .businessDetailsMobileNumber ==
                            null
                        ? null
                        : false,
                    businessEmail:
                        context.read<QrBloc>().createQrModel.businessEmail ==
                                null
                            ? null
                            : false,
                    websiteLink:
                        context.read<QrBloc>().createQrModel.websiteLink == null
                            ? null
                            : false,
                    accreditation:
                        context.read<QrBloc>().createQrModel.accreditation ==
                                null
                            ? null
                            : false,
                    company:
                        context.read<QrBloc>().createQrModel.company == null
                            ? null
                            : false,
                  );
            }
          });
        }, neonShade),
        adjustHieght(5),
        buildSwitch("Company Name", context.read<QrBloc>().createQrModel.company,
            (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(company: value);
            }
          });
        }),
        buildSwitch("Business Phone Number",
            context.read<QrBloc>().createQrModel.businessDetailsMobileNumber,
            (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(businessDetailsMobileNumber: value);
            }
          });
        }),
        buildSwitch("Business Email",
            context.read<QrBloc>().createQrModel.businessEmail, (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(businessEmail: value);
            }
          });
        }),
        buildSwitch(
            "Website Link", context.read<QrBloc>().createQrModel.websiteLink,
            (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(websiteLink: value);
            }
          });
        }),
        buildSwitch("Company Achievements",
            context.read<QrBloc>().createQrModel.accreditation, (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(accreditation: value);
            }
          });
        }),
        buildSwitch("Address", context.read<QrBloc>().createQrModel.address,
            (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(address: value);
            }
          });
        }),
        buildSwitch("Business Social Medias",
            context.read<QrBloc>().createQrModel.socialMediaHandles, (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(socialMediaHandles: value);
            }
          });
        }),
      ],
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
              trackOutlineColor: MaterialStatePropertyAll(value == null
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
