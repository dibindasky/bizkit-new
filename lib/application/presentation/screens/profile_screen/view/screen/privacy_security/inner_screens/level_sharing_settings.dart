import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/domain/model/qr/defauilt_qr/defauilt_qr.dart';
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
              adjustHieght(khieght * .05),
              const DefaultSwitchButtons(),
              adjustHieght(khieght * .1),
              BlocConsumer<QrBloc, QrState>(
                listener: (context, state) {
                  // if (state.defauiltQr != null) {
                  //   showSnackbar(context, message: 'Updated successfully');
                  //   Navigator.pop(context);
                  // }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return AuthButton(
                    text: 'Save',
                    onTap: () {
                      context.read<QrBloc>().add(QrEvent.defaultQr(
                          defauiltQr: context.read<QrBloc>().defauiltQr));
                      showSnackbar(context, message: 'Updated successfully');
                      Navigator.pop(context);
                    },
                  );
                },
              ),
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
    context.read<QrBloc>().add(const QrEvent.getDefaultQr());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(builder: (context, state) {
      if (state.defauiltQr != null) {
        DefauiltQr defaultQrModel = state.defauiltQr!;
        context.read<QrBloc>().defauiltQr = state.defauiltQr!;
        return Column(
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
            adjustHieght(5),
            buildSwitch("Email", defaultQrModel.email!, (value) {
              setState(() {
                defaultQrModel.email = value;
                context.read<QrBloc>().defauiltQr =
                    context.read<QrBloc>().defauiltQr.copyWith(email: value);
              });
            }),
            buildSwitch("Phone Number", defaultQrModel.phoneNumber ?? false,
                (value) {
              setState(() {
                defaultQrModel.phoneNumber = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(phoneNumber: value);
              });
            }),
            buildSwitch("Company", defaultQrModel.company ?? false, (value) {
              setState(() {
                defaultQrModel.company = value;
                context.read<QrBloc>().defauiltQr =
                    context.read<QrBloc>().defauiltQr.copyWith(company: value);
              });
            }),
            buildSwitch("Personal SocialMedias",
                defaultQrModel.personalSocialMedia ?? false, (value) {
              setState(() {
                defaultQrModel.personalSocialMedia = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(personalSocialMedia: value);
              });
            }),
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
            adjustHieght(5),
            buildSwitch("Business PhoneNumber",
                defaultQrModel.businessDetailsMobileNumber ?? false, (value) {
              setState(() {
                defaultQrModel.businessDetailsMobileNumber = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(businessDetailsMobileNumber: value);
              });
            }),
            buildSwitch("Business Email", defaultQrModel.businessEmail ?? false,
                (value) {
              setState(() {
                defaultQrModel.businessEmail = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(businessEmail: value);
              });
            }),
            buildSwitch("Website Link", defaultQrModel.websiteLink ?? false,
                (value) {
              setState(() {
                defaultQrModel.websiteLink = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(websiteLink: value);
              });
            }),
            buildSwitch("Address", defaultQrModel.address ?? false, (value) {
              setState(() {
                context.read<QrBloc>().defauiltQr =
                    context.read<QrBloc>().defauiltQr.copyWith(address: value);
              });
            }),
            buildSwitch("Business SocialMedias",
                defaultQrModel.socialMediaHandles ?? false, (value) {
              setState(() {
                defaultQrModel.socialMediaHandles = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(socialMediaHandles: value);
              });
            }),
            adjustHieght(khieght * .03),
            buildSwitch(
                "Update all cards", defaultQrModel.updateAllCards ?? false,
                (value) {
              setState(() {
                defaultQrModel.updateAllCards = value;
                context.read<QrBloc>().defauiltQr = context
                    .read<QrBloc>()
                    .defauiltQr
                    .copyWith(updateAllCards: value);
              });
            }),
          ],
        );
      } else {
        return Text('You are not allowed');
      }
    });
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
