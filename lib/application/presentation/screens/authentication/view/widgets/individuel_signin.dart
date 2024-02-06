import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/Auth/auth_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/otp_screen.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividuelSignIn extends StatelessWidget {
  IndividuelSignIn({super.key});

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> personalSignup = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeIn(
        duration: const Duration(milliseconds: 700),
        delay: const Duration(milliseconds: 200),
        child: Form(
          key: personalSignup,
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
                text: 'Name',
                controller: nameController,
                validate: Validate.notNull,
              ),
              TTextFormField(
                validate: Validate.phone,
                text: 'Mobile Number',
                controller: mobileController,
                inputType: TextInputType.number,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.otpSend) {
                    // navigate to otp screen when send
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenOtpValidation(
                                  email: emailIdController.text.trim(),
                                )));
                  } else if (state.otpVerified) {
                    Navigator.pop(context);
                  } else if (state.otpVerificationError) {
                    print('otp verification error');
                  }
                },
                builder: (context, state) {
                  return TTextFormField(
                    showUnderline: state.showValidateError,
                    validate: Validate.email,
                    text: 'Company mail',
                    controller: emailIdController,
                    inputType: TextInputType.emailAddress,
                    suffix: TextButton(
                      onPressed: () {
                        if (isValidEmail(emailIdController.text.trim())) {
                          print('otp send individual');
                          context.read<AuthBloc>().add(AuthEvent.sendOtp(
                              emailModel: EmailModel(
                                  email: emailIdController.text.trim())));
                        } else {
                          showSnackbar(context,
                              message: 'enter a valid email',
                              textColor: kwhite,
                              backgroundColor: kred,
                              duration: 1);
                        }
                      },
                      child: Text(
                        'Verify',
                        style: TextStyle(
                            fontWeight: state.showValidateError
                                ? FontWeight.w700
                                : null),
                      ),
                    ),
                  );
                },
              ),
              TTextFormField(
                validate: Validate.password,
                text: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              TTextFormField(
                validate: Validate.rePassword,
                password: passwordController,
                text: 'Re-enter password',
                controller: rePasswordController,
                obscureText: true,
              ),
              adjustHieght(khieght * .09),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return Column(
                    children: [
                      state.showValidateError
                          ? const Text(
                              'Need to verify email before sign-up',
                              style: TextStyle(color: kred),
                            )
                          : const SizedBox(),
                      adjustHieght(10),
                      AuthButton(
                        text: 'Sign-Up',
                        onTap: () {
                          if (!state.otpVerified) {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.showValidateError());
                          } else if (personalSignup.currentState!.validate()) {
                            final SignUpIndivudalModel signUpModel = SignUpIndivudalModel(
                                name: nameController.text.trim(),
                                email: emailIdController.text.trim(),
                                password: passwordController.text.trim(),
                                phoneNumber: mobileController.text.trim());
                            context.read<AuthBloc>().add(
                                  AuthEvent.registerIndividual(signUpIndivudalModel: signUpModel),
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
