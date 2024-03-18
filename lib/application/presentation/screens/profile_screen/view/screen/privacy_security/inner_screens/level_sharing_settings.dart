import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/level_sharing.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultLevelSharing extends StatelessWidget {
  const DefaultLevelSharing({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Default level settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.only(left: 15, right: 10),
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
              adjustHieght(khieght * .1),
              SwitchButtons(),
              // SwitchListTile(
              //   title: Text(
              //     'Peronal details',
              //     style: textHeadStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Name',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Email',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Blood group',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Place',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Third Person QR',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Third Person QR',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Business Details',
              //     style: textHeadStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // SwitchListTile(
              //   title: Text(
              //     'Business Name',
              //     style: textStyle1,
              //   ),
              //   value: true,
              //   onChanged: (value) {},
              // ),
              adjustHieght(khieght * .1),
              AuthButton(
                text: 'Save',
                onTap: () {},
              ),
              adjustHieght(khieght * .03),
            ],
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
              CreateQrModel createQrModel = CreateQrModel();
              createQrModel.copyWith(
                address: false,
                socialMediaHandles: false,
                businessDetailsMobileNumber: false,
                businessEmail: false,
                websiteLink: false,
              );
              context
                  .read<ProfileBloc>()
                  .add(ProfileEvent.defaultQr(createQrModel: createQrModel));
            }
          });
        }, neonShade),
        adjustHieght(5),
        buildSwitch("Email", context.read<QrBloc>().createQrModel.email!,
            (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(email: value);
            }
          });
        }),
        buildSwitch(
            "Phone Number", context.read<QrBloc>().createQrModel.phoneNumber!,
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
        buildSwitch("Company", context.read<QrBloc>().createQrModel.company!,
            (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(company: value);
            }
          });
        }),
        buildSwitch("Personal SocialMedias",
            context.read<QrBloc>().createQrModel.personalSocialMedia!, (value) {
          setState(() {
            if (personalDetals) {
              context.read<QrBloc>().createQrModel = context
                  .read<QrBloc>()
                  .createQrModel
                  .copyWith(personalSocialMedia: value);
            }
          });
        }),
        adjustHieght(khieght * .02),
        buildSwitch("Business Details", businessDetals, (value) {
          setState(() {
            businessDetals = value;
            // If "Busiess Details" is false, disable other switches
            if (!value) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(
                        address: false,
                        socialMediaHandles: false,
                        businessDetailsMobileNumber: false,
                        businessEmail: false,
                        websiteLink: false,
                      );
            }
          });
        }, neonShade),
        adjustHieght(5),
        buildSwitch("Business PhoneNumber",
            context.read<QrBloc>().createQrModel.businessDetailsMobileNumber!,
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
            context.read<QrBloc>().createQrModel.businessEmail ?? false,
            (value) {
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
            "Website Link", context.read<QrBloc>().createQrModel.websiteLink!,
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
        buildSwitch("Address", context.read<QrBloc>().createQrModel.address!,
            (value) {
          setState(() {
            if (businessDetals) {
              context.read<QrBloc>().createQrModel =
                  context.read<QrBloc>().createQrModel.copyWith(address: value);
            }
          });
        }),
        buildSwitch("Business SocialMedias",
            context.read<QrBloc>().createQrModel.socialMediaHandles!, (value) {
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

  Widget buildSwitch(String label, bool value, Function(bool) onChanged,
      [Color color = textFieldFillColr]) {
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
            ),
          ],
        ),
      ),
    );
  }
}
