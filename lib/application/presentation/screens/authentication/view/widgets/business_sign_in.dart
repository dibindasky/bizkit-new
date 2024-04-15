import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BusinessSignIn extends StatelessWidget {
  BusinessSignIn({super.key});

  final TextEditingController companyMailController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companynameController = TextEditingController();
  final TextEditingController companyWebsiteController =
      TextEditingController();
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
                textCapitalization: TextCapitalization.words,
                controller: companynameController,
              ),
              TTextFormField(
                onChanaged: (value) {
                  if (value.length < 3) {
                    companyMailController.text = '';
                  } else {
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpEvent.buildEmail());
                  }
                },
                validate: Validate.notNull,
                text: 'Website',
                controller: companyWebsiteController,
                inputType: TextInputType.url,
              ),
              TTextFormField(
                text: 'Company Mobile Number',
                maxlegth: 10,
                controller: companyPhoneController,
                validate: Validate.phone,
                inputType: TextInputType.phone,
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  String web = companyWebsiteController.text
                      .replaceFirst('https://', '');
                  web = web.replaceFirst('http://', '');
                  web = web.replaceFirst('www.', '');
                  // web = web.replaceFirst('www.', '');
                  return AutocompleteTextField(
                    enabled: false,
                    label: 'Company Mail',
                    validate: Validate.adminEmail,
                    controller: companyMailController,
                    autocompleteItems: companyWebsiteController.text.length < 3
                        ? []
                        : ['info@$web', 'admin@$web', 'sales@$web'],
                  );
                },
              ),
              TTextFormField(
                text: 'Address',
                controller: addressController,
                textCapitalization: TextCapitalization.words,
                validate: Validate.notNull,
              ),
              PasswordHintmakers(passwordController: passwordController),
              TTextFormField(
                text: 'ReEnter Password',
                controller: rePasswordController,
                password: passwordController,
                validate: Validate.rePassword,
                obscureText: true,
              ),
              adjustHieght(khieght * .01),
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Text('Alredy have an account?  Login')),
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
                        isVerified: true,
                        websiteLink: companyWebsiteController.text.trim(),
                        address: addressController.text.trim(),
                        companyName: companynameController.text.trim(),
                        email: companyMailController.text.trim(),
                        password: passwordController.text.trim(),
                        phoneNumber: companyPhoneController.text.trim());
                    GoRouter.of(context)
                        .pushNamed(Routes.otpPage, pathParameters: {
                      'email': companyMailController.text.trim(),
                      'fromBusiness': 'true',
                      'model': jsonEncode(
                          {'signUpModel': jsonEncode(signUpModel.toJson())})
                    });
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return Column(
                    children: [
                      state.isLoading
                          ? const LoadingAnimation()
                          : AuthButton(
                              text: 'Sign-Up',
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
                            adjustHieght(30),
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

class PasswordHintmakers extends StatefulWidget {
  const PasswordHintmakers({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  State<PasswordHintmakers> createState() => _PasswordHintmakersState();
}

class _PasswordHintmakersState extends State<PasswordHintmakers> {
  bool showHint = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: showHint, child: adjustHieght(5)),
        Visibility(
          visible: showHint,
          child: Text(
            'Password must contain 8 characters and should have 1 uppercase, 1 lowercase, 1 special character and 1 number',
            style: textStyle1.copyWith(color: kred.withOpacity(0.7)),
          ),
        ),
        TTextFormField(
          onTap: () {
            if (!showHint) {
              setState(() {
                showHint = true;
              });
            }
          },
          onTapOutside: () => setState(() {
            showHint = false;
          }),
          text: 'Password',
          validate: Validate.password,
          controller: widget.passwordController,
          obscureText: true,
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
