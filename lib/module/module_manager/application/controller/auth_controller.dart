import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/data/service/auth/auth_service.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_post_phone_model/auth_post_phone_model.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/authentication_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthenticationController extends GetxController {
  AuthenticationRepo authRepo = AuthenticationService();

  RxBool loadingLogin = false.obs;
  RxBool loadingregister = false.obs;
  RxBool loadingOtpEmail = false.obs;
  RxBool loadingOtpPhone = false.obs;
  // varibale to navigate ot to clal functions according to the otp type
  RxBool otpFromRegisterUser = false.obs;

  // model used to save data temproraly for signup
  Rx<AuthPostmodel> postModel = AuthPostmodel().obs;

  // register
  void registerUser(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingregister.value = true;
    postModel.value = authPostModel;
    final result = await authRepo.registerUser(
        authPostmodel: AuthPostmodel(
            email: authPostModel.email,
            phoneNumber: authPostModel.phoneNumber));
    result.fold((l) {
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      otpFromRegisterUser.value = true;
      GoRouter.of(context).pushNamed(Routes.otpPage);
      showSnackbar(context,
          message: r.message ?? 'Otp send to your mail id',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingregister.value = false;
  }

  void verifyOtpEmailRegestration(BuildContext context,
      {required String otp}) async {
    loadingOtpEmail.value = true;
    final result = await authRepo.otpVerification(
        authPostmodel: postModel.value.copyWith(otp: otp));
    result.fold((l) {
      GoRouter.of(context).pop();
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      SecureStorage.saveToken(tokenModel: r);
      SecureStorage.setLogin();
      context.go(Routes.taskNavbar);
      showSnackbar(context,
          message: 'User Registered Successfully',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingOtpEmail.value = false;
  }

  void loginUser(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingLogin.value = true;
    postModel.value = authPostModel;
    final result = await authRepo.loginUser(
        authPostmodel: AuthPostmodel(phoneNumber: authPostModel.phoneNumber));
    result.fold((l) {
      log('Otp resent failed');
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      log('Otp resent successs');
      otpFromRegisterUser.value = false;
      GoRouter.of(context).pushNamed(Routes.otpPage);
      showSnackbar(context,
          message: 'Otp send to your registered mobile number',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingLogin.value = false;
  }

  void verifyOtpLoginPhone(BuildContext context, {required String otp}) async {
    loadingOtpPhone.value = true;
    final result = await authRepo.otpVerificationPhone(
        authPostmodel: AuthPostPhoneModel(
            otp: otp, phoneNumber: postModel.value.phoneNumber));
    result.fold((l) {
      GoRouter.of(context).pop();
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      SecureStorage.saveToken(tokenModel: r);
      SecureStorage.setLogin();
      context.go(Routes.taskNavbar);
      showSnackbar(context,
          message: 'User Logged In Successfully',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingOtpPhone.value = false;
  }

  void logOut(BuildContext context) async {
    context.go(Routes.loginPage);
    authRepo.logOut();
    SecureStorage.clearLogin();
  }

  void checkLoginStatus(BuildContext context) async {
    await SecureStorage.getLogin().then((loginStatus) {
      if (!loginStatus) {
        // if user not loged in navigate to loginpage
        context.go(Routes.loginPage);
      } else {
        // change this according to the module need to be shown
        context.go(Routes.taskNavbar);
      }
    });
  }
}
