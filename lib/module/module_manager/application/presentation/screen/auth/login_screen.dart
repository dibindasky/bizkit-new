import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController emailPhonePasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginOtpKey = GlobalKey();
  final GlobalKey<FormState> loginPasswordKey = GlobalKey();
  bool tapOnPassword = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailPhoneController.dispose();
    emailPhonePasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    final size = MediaQuery.of(context).size;
    khieght = size.height;
    kwidth = size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              adjustHieght(khieght * 0.10),
              SizedBox(
                width: double.infinity,
                height: khieght * 0.25,
                child: Image.asset('asset/images/Bizkit.png'),
              ),
              Text(
                'Your key to your business',
                style: custumText(
                  fontSize: kwidth * 0.043,
                  fontWeight: FontWeight.bold,
                ),
              ),
              adjustHieght(khieght * .02),
              Container(
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: knill,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: neonShade),
                  labelColor: kwhite,
                  unselectedLabelColor: kwhite,
                  tabs: [
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text('OTP Login'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text('Password Login'),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight20,
              SizedBox(
                height: 350, // Adjust this height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // OTP Login Tab
                    Form(
                      key: loginOtpKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            kHeight10,
                            CustomTextFormField(
                              labelText: 'Email or Phone',
                              controller: emailPhoneController,
                              validate: Validate.emailOrPhone,
                              inputType: TextInputType.emailAddress,
                            ),
                            kHeight20,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(() {
                                return controller.loadingLogin.value
                                    ? const LoadingAnimation()
                                    : EventButton(
                                        text: 'Send OTP',
                                        onTap: () {
                                          if (loginOtpKey.currentState!
                                              .validate()) {
                                            final isEmail = isValidEmail(
                                                emailPhoneController.text);
                                            FocusScope.of(context).unfocus();
                                            controller.loginUser(
                                              context,
                                              authPostModel: isEmail
                                                  ? AuthPostmodel(
                                                      email:
                                                          emailPhoneController
                                                              .text)
                                                  : AuthPostmodel(
                                                      phoneNumber:
                                                          '+91${emailPhoneController.text}'),
                                              emailLogin: isEmail,
                                            );
                                          }
                                        },
                                      );
                              }),
                            ),
                            kHeight30,
                            _signUP(context)
                          ],
                        ),
                      ),
                    ),
                    // Password Login Tab
                    Form(
                      key: loginPasswordKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            kHeight10,
                            CustomTextFormField(
                              labelText: 'Email or Phone',
                              controller: emailPhonePasswordController,
                              validate: Validate.emailOrPhone,
                              inputType: TextInputType.emailAddress,
                            ),
                            kHeight20,
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear,
                              height: tapOnPassword ? null : 0,
                              child: tapOnPassword
                                  ? Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        maxLines: 3,
                                        'Password must contain at least 8 characters, including lowercase & uppercase letters, numbers, and special characters',
                                        style: textThinerStyle1,
                                      ),
                                    )
                                  : kempty,
                            ),
                            CustomTextFormField(
                              onTap: () => setState(() {
                                tapOnPassword = true;
                              }),
                              onTapOutside: () => setState(() {
                                tapOnPassword = false;
                              }),
                              labelText: 'Password',
                              controller: passwordController,
                              validate: Validate.password,
                              inputType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            kHeight20,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(() {
                                return controller.loadingLoginPassword.value
                                    ? const LoadingAnimation()
                                    : EventButton(
                                        text: 'Login',
                                        onTap: () {
                                          if (loginPasswordKey.currentState!
                                              .validate()) {
                                            final isPhone = isValidPhoneNumber(
                                                emailPhonePasswordController
                                                    .text);
                                            String emailOrPhone =
                                                emailPhonePasswordController
                                                    .text;
                                            print(
                                                'email or phone  ==> $emailOrPhone');
                                            if (isPhone) {
                                              emailOrPhone = '+91$emailOrPhone';
                                            }
                                            FocusScope.of(context).unfocus();
                                            controller.loginUsingPassword(
                                              context,
                                              authPostModel: AuthPostmodel(
                                                emailOrPhone: emailOrPhone,
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                          }
                                        },
                                      );
                              }),
                            ),
                            kHeight30,
                            _signUP(context)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _signUP(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: kwidth * 0.03,
          ),
        ),
        adjustWidth(10),
        InkWell(
          onTap: () async {
            await GoRouter.of(context)
                .pushNamed(Routes.signUpPage)
                .then((value) {
              FocusScope.of(context).unfocus();
            });
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: kwidth * 0.037,
              decoration: TextDecoration.underline,
              decorationColor: kwhite,
            ),
          ),
        ),
      ],
    );
  }
}
