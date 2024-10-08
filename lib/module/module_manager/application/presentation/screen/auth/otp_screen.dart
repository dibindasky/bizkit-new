import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ScreenOtpValidation extends StatelessWidget {
  const ScreenOtpValidation(
      {super.key, required this.isEmail, this.onComplete});

  final bool isEmail;
  final Function(String value)? onComplete;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new, color: kwhite),
              ),
              adjustHieght(40),
              Text('Enter OTP to verify',
                  style: textHeadStyle1.copyWith(
                      color: neonShade, fontSize: kwidth * 0.07)),
              adjustHieght(20),
              Text(
                  'A 4 digit OTP has been sent to your ${isEmail ? 'email address' : 'phone number'}'),
              // const Text(
              //   "email",
              //   style: TextStyle(color: neonShade),
              // ),
              adjustHieght(20),
              Text('Enter OTP Text', style: textHeadStyle1),
              adjustHieght(20),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.start,
                onCompleted: (value) {
                  if (onComplete != null) {
                    onComplete!(value);
                  } else {
                    if (controller.otpFromRegisterUser.value) {
                      controller.verifyOtpEmailRegestration(context,
                          otp: value);
                    } else {
                      controller.verifyOtpLogin(context,
                          otp: value, isEmail: isEmail);
                    }
                  }
                },
                length: 4,
                defaultPinTheme: PinTheme(
                  width: kwidth * 0.11,
                  height: kwidth * 0.11,
                  textStyle: textHeadStyle1.copyWith(
                      fontSize: kwidth * .060, color: kblack),
                  decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: [
                      BoxShadow(
                        color: neonShade.withOpacity(0.03),
                        offset: const Offset(0, 6),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(color: neonShade),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const Spacer(),
              Obx(() {
                if (controller.loadingOtpEmail.value ||
                    controller.loadingOtpPhone.value) {
                  return const LoadingAnimation();
                }
                return kempty;
              }),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
