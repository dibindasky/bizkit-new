import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ScreenOtpValidation extends StatelessWidget {
  const ScreenOtpValidation(
      {super.key,
      required this.email,
      this.fromBusiness,
      this.signUpModel,
      this.signUpIndivudalModel});

  final String email;
  final bool? fromBusiness;
  final SignUpModel? signUpModel;
  final SignUpIndivudalModel? signUpIndivudalModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new, color: kwhite)),
              adjustHieght(40),
              Text('Enter OTP to verify',
                  style: textHeadStyle1.copyWith(
                      color: neonShade, fontSize: kwidth * 0.07)),
              adjustHieght(20),
              const Text('A 4 digit OTP has been sent to your mail address'),
              Text(
                email,
                style: const TextStyle(color: neonShade),
              ),
              adjustHieght(20),
              Text('Enter OTP Text', style: textHeadStyle1),
              adjustHieght(20),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.start,
                onCompleted: (value) {
                  if (fromBusiness != null) {
                    context.read<SignUpBloc>().add(SignUpEvent.verifyOtp(
                        isBusiness: fromBusiness!,
                        signUpIndivudalModel: signUpIndivudalModel,
                        signUpModel: signUpModel,
                        verifyOtpModel:
                            VerifyOtpModel(email: email, otp: value)));
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
              BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.otpBusinessError || state.otpIndividualError) {
                    Navigator.pop(context);
                  }

                  if (state.message != null) {
                    showSnackbar(context,
                        message: state.message!,
                        backgroundColor: state.hasError ? kred : neonShade);
                  }
                  if (state.signUpResponseModel != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoGInScreen()),
                        (route) => true);
                  }
                },
                builder: (context, state1) {
                  return BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.otpVerificationError) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state.isLoading || state1.isLoading) {
                        return const LoadingAnimation();
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                },
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
