import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BusinessSignIn extends StatefulWidget {
  const BusinessSignIn({super.key});

  @override
  State<BusinessSignIn> createState() => _BusinessSignInState();
}

class _BusinessSignInState extends State<BusinessSignIn> {
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
  void initState() {
    // FocusScope.of(context).unfocus();
    super.initState();
  }

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
              CustomTextFormField(
                validate: Validate.notNull,
                labelText: 'Company Name',
                textCapitalization: TextCapitalization.words,
                controller: companynameController,
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              CustomTextFormField(
                onChanaged: (value) {
                  formatWebsiteUrl(value, companyWebsiteController);
                  if (value.length < 3) {
                    companyMailController.text = '';
                  } else {
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpEvent.buildEmail());
                  }
                },
                validate: Validate.notNull,
                labelText: 'Website',
                controller: companyWebsiteController,
                inputType: TextInputType.url,
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              CustomTextFormField(
                labelText: 'Company Contact Number',
                // maxlegth: 10,
                controller: companyPhoneController,
                // validate: Validate.phone,
                inputType: TextInputType.phone,
                onTapOutside: () => FocusScope.of(context).unfocus(),
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
              CustomTextFormField(
                labelText: 'Address',
                controller: addressController,
                textCapitalization: TextCapitalization.words,
                validate: Validate.notNull,
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              PasswordHintmakers(passwordController: passwordController),
              CustomTextFormField(
                labelText: 'Re-Enter Password',
                controller: rePasswordController,
                password: passwordController,
                validate: Validate.rePassword,
                obscureText: true,
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              adjustHieght(khieght * .01),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Text.rich(
                  TextSpan(
                    text: 'Already have an account?   ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: kwhite,
                        ),
                      ),
                    ],
                  ),
                ),
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
                          : EventButton(
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
                      adjustHieght(70),
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
        CustomTextFormField(
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
          labelText: 'Password',
          validate: Validate.password,
          controller: widget.passwordController,
          obscureText: true,
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
