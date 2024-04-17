import 'package:bizkit/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart';
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ForgottPasswrodOTPScreen extends StatelessWidget {
  const ForgottPasswrodOTPScreen({super.key, required this.email});

  final String email;

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
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new, color: kwhite),
              ),
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
                  context
                      .read<ForgottPasswordBloc>()
                      .add(ForgottPasswordEvent.verifyforgotPasswordOTPEmail(
                        verifyOtpModel: VerifyOtpModel(
                          email: email,
                          otp: value,
                        ),
                      ));
                },
                length: 4,
                defaultPinTheme: PinTheme(
                  width: kwidth * 0.11,
                  height: kwidth * 0.11,
                  textStyle: textHeadStyle1.copyWith(
                    fontSize: kwidth * .060,
                    color: kblack,
                  ),
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
              BlocConsumer<ForgottPasswordBloc, ForgottPasswordState>(
                listener: (context, state) {
                  if (state.otpVerificationError) {
                    GoRouter.of(context).pop();
                    showSnackbar(
                      context,
                      message: state.message ?? errorMessage,
                    );
                  }
                  Map<String, String> map = {};
                  if (state.otpVerifiedForgotPassword) {
                    map['email'] = email;
                    context.goNamed(
                      Routes.newPasswordScreen,
                      pathParameters: map,
                    );
                    // GoRouter.of(context).pushNamed(
                    //   Routes.newPasswordScreen,
                    //   pathParameters: map,
                    // );
                  }
                },
                builder: (context, state1) {
                  return BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.otpVerificationError) {
                        GoRouter.of(context).pop();
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
