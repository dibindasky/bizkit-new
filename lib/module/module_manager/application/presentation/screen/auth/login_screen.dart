import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
    _tabController.addListener((){
      if(_tabController.indexIsChanging){
        FocusScope.of(context).unfocus();
      }
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              adjustHieght(khieght * 0.20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              adjustHieght(khieght * .02),
              Container(
                decoration: BoxDecoration(
                  color: kblack,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: knill,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kneonShade),
                  labelColor: kblack,
                  unselectedLabelColor: kwhite,
                  tabs: [
                    Tab(
                      child: Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          'OTP Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text('Password Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1)),
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
                                    : GestureDetector(
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
                                        child: Container(
                                          width: double.infinity,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: kneonShade),
                                          child: Center(
                                              child: Text(
                                            'Send otp',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          )),
                                        ),
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
                                    : GestureDetector(
                                        child: Container(
                                            height: 55,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: kneonShade),
                                            child: Center(
                                                child: Text(
                                              'Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ))),
                                        onTap: () {
                                          if (loginPasswordKey.currentState!
                                              .validate()) {
                                            final isPhone = isValidPhoneNumber(
                                                emailPhonePasswordController
                                                    .text);
                                            String emailOrPhone =
                                                emailPhonePasswordController
                                                    .text;
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
          'Don\'t have an account? ',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: () async {
            await GoRouter.of(context)
                .pushNamed(Routes.signUpPage)
                .then((value) {
              FocusScope.of(context).unfocus();
            });
          },
          child: const Text('Sign Up', style: TextStyle(color: kneonDark)),
        ),
      ],
    );
  }
}
