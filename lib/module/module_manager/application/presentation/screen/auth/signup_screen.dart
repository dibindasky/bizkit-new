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
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> personalSignup = GlobalKey();

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
                  // company mail
                  // BlocListener<SignUpBloc, SignUpState>(
                  //   listener: (context, state) {
                  //     if (state.message != null) {
                  //       showSnackbar(context,
                  //           message: state.message!,
                  //           backgroundColor: state.hasError ? kred : neonShade);
                  //     }
                  //     if (state.otpSendIndividual) {
                  //       // navigate to otp screen when send
                  //       // final SignUpIndivudalModel signUpModel =
                  //       //     SignUpIndivudalModel(
                  //       //   isBusiness: false,
                  //       //   isVerified: false,
                  //       //   name: nameController.text.trim(),
                  //       //   email: emailIdController.text.trim(),
                  //       //   password: passwordController.text.trim(),
                  //       //   phoneNumber: mobileController.text.trim(),
                  //       // );
                  //       // print('otp individual got');
                  //       // GoRouter.of(context)
                  //       //     .pushNamed(Routes.otpPage, pathParameters: {
                  //       //   'email': emailIdController.text.trim(),
                  //       //   'fromBusiness': 'false',
                  //       //   'model': jsonEncode({
                  //       //     'signUpIndivudalModel':
                  //       //         jsonEncode(signUpModel.toJson())
                  //       //   })
                  //       // });
                  //     }
                  //   },
                  //   child: CustomTextFormField(
                  //     validate: Validate.email,
                  //     labelText: 'Mail',
                  //     onTapOutside: () {
                  //       FocusScope.of(context).unfocus();
                  //     },
                  //     controller: emailIdController,
                  //     inputType: TextInputType.emailAddress,
                  //     onChanaged: (value) =>
                  //         formatWebsiteUrl(value, emailIdController),
                  //   ),
                  // ),
                  // TTextFormField(
                  //   validate: Validate.password,
                  //   password: passwordController,
                  //   text: 'Password',
                  //   controller: passwordController,
                  //   inputType: TextInputType.visiblePassword,
                  //   obscureText: true,
                  // ),
                  // PasswordHintmaker(passwordController: passwordController),
                  // CustomTextFormField(
                  //   validate: Validate.rePassword,
                  //   password: passwordController,
                  //   labelText: 'Re-Enter Password',
                  //   controller: rePasswordController,
                  //   inputType: TextInputType.visiblePassword,
                  //   obscureText: true,
                  //   onTapOutside: () {
                  //     FocusScope.of(context).unfocus();
                  //   },
                  // ),
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
                                        email: emailIdController.text,
                                        name: nameController.text,
                                        phoneNumber:
                                            '+91${mobileController.text}'));
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
