import 'dart:developer';

import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:get/get.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp>
    with SingleTickerProviderStateMixin {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> personalSignup = GlobalKey();

  int showPassword = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: knill,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: FadeIn(
            duration: const Duration(milliseconds: 700),
            delay: const Duration(milliseconds: 200),
            child: Form(
              key: personalSignup,
              child: Column(
                children: [
                  adjustHieght(khieght * 0.1),
                  Text(
                    'Create your key to your business kit',
                    style: custumText(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  adjustHieght(khieght * .04),
                  CustomTextFormField(
                    labelText: 'Name',
                    onTapOutside: () {
                      FocusScope.of(context).unfocus();
                    },
                    controller: nameController,
                    validate: Validate.notNull,
                    textCapitalization: TextCapitalization.words,
                    inputType: TextInputType.text,
                  ),
                  CustomTextFormField(
                    validate: Validate.phone,
                    maxlegth: 10,
                    labelText: 'Mobile Number',
                    controller: mobileController,
                    onTapOutside: () {
                      FocusScope.of(context).unfocus();
                    },
                    inputType: TextInputType.number,
                  ),
                  CustomTextFormField(
                    validate: Validate.email,
                    labelText: 'Mail',
                    onTapOutside: () {
                      FocusScope.of(context).unfocus();
                    },
                    controller: emailIdController,
                    inputType: TextInputType.emailAddress,
                    onChanaged: (value) =>
                        formatWebsiteUrl(value, emailIdController),
                  ),
                  CustomTextFormField(
                    obscureText: showPassword != 1,
                    validate: Validate.password,
                    labelText: 'password',
                    onTapOutside: () {
                      FocusScope.of(context).unfocus();
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (showPassword == 1) {
                            showPassword = 0;
                          } else if (showPassword == 0) {
                            showPassword = 1;
                          }
                          setState(() {});
                        },
                        icon: Icon(showPassword == 1
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined)),
                    controller: passwordController,
                  ),
                  CustomTextFormField(
                    obscureText: showPassword != 2,
                    validate: Validate.rePassword,
                    labelText: 'confirm password',
                    onTapOutside: () {
                      FocusScope.of(context).unfocus();
                    },
                    password: passwordController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (showPassword == 2) {
                            showPassword = 0;
                          } else if (showPassword == 0) {
                            showPassword = 2;
                          }
                          setState(() {});
                        },
                        icon: Icon(showPassword == 2
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined)),
                    controller: rePasswordController,
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
                  Obx(() {
                    return controller.loadingregister.value
                        ? const LoadingAnimation()
                        : EventButton(
                            text: 'SignUp',
                            onTap: () {
                              if (personalSignup.currentState!.validate()) {
                                controller.registerUser(context,
                                    authPostModel: AuthPostmodel(
                                        password: passwordController.text,
                                        email: emailIdController.text,
                                        name: nameController.text,
                                        phoneNumber:
                                            '+91${mobileController.text}'));
                                //log('${AuthPostmodel(password: passwordController.text, email: emailIdController.text, name: nameController.text, phoneNumber: '+91${mobileController.text}')}');
                                // context.read<SignUpBloc>().add(
                                //       SignUpEvent.sendOtp(
                                //         emailModel: EmailModel(
                                //             email: emailIdController.text.trim()),
                                //         isBusiness: false,
                                //       ),
                                //     );
                              }
                            },
                          );
                  }),
                  adjustHieght(70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
