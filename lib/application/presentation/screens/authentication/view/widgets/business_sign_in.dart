import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/otp_screen.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessSignIn extends StatelessWidget {
  BusinessSignIn({super.key});

  final TextEditingController companyMailController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companynameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> businessSignup = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 700),
      delay: const Duration(milliseconds: 200),
      child: SingleChildScrollView(
        child: Form(
          key: businessSignup,
          child: Column(
            children: [
              adjustHieght(khieght * .04),
              Text(
                'Create your key to your business kit',
                style: custumText(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              adjustHieght(khieght * .04),
              TTextFormField(
                validate: Validate.notNull,
                text: 'Company Name',
                controller: companynameController,
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return TTextFormField(
                    showUnderline: state.otpBusinessError,
                    validate: Validate.email,
                    text: 'Company mail',
                    controller: companyMailController,
                    inputType: TextInputType.emailAddress,
                  );
                },
              ),
              TTextFormField(
                text: 'Company Mobile Number',
                controller: companyPhoneController,
                validate: Validate.phone,
                inputType: TextInputType.phone,
              ),
              TTextFormField(
                text: 'Address',
                controller: addressController,
                validate: Validate.notNull,
              ),
              TTextFormField(
                text: 'Password',
                validate: Validate.password,
                controller: passwordController,
                obscureText: true,
              ),
              TTextFormField(
                text: 'ReEnter Password',
                controller: rePasswordController,
                password: passwordController,
                validate: Validate.rePassword,
                obscureText: true,
              ),
              adjustHieght(khieght * .04),
              BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.hasError || state.message != null) {
                    showSnackbar(context,
                        message: state.message!,
                        backgroundColor: state.hasError ? kred : neonShade);
                  }
                  if (state.otpBusinessError || state.otpIndividualError) {
                    Navigator.pop(context);
                  } else if (state.otpSendBusiness) {
                    final SignUpModel signUpModel = SignUpModel(
                        isBusiness: true,
                        address: addressController.text.trim(),
                        companyName: companynameController.text.trim(),
                        email: companyMailController.text.trim(),
                        password: passwordController.text.trim(),
                        phoneNumber: companyPhoneController.text.trim());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenOtpValidation(
                            signUpModel: signUpModel,
                            fromBusiness: true,
                            email: companyMailController.text.trim()),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return Column(
                    children: [
                      state.otpBusinessError
                          ? const Text(
                              'Need to verify email before sign-up',
                              style: TextStyle(color: kred),
                            )
                          : const SizedBox(),
                      adjustHieght(10),
                      state.isLoading
                          ? const LoadingAnimation()
                          : AuthButton(
                              text: 'Verify',
                              onTap: () {
                                if (businessSignup.currentState!.validate()) {
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.sendOtp(
                                          isBusiness: true,
                                          emailModel: EmailModel(
                                            email: companyMailController.text
                                                .trim(),
                                          ),
                                        ),
                                      );
                                }
                              },
                            ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
