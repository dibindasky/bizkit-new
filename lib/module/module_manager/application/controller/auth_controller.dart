import 'dart:async';
import 'dart:developer';

import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/data/service/auth/auth_service.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/authentication_repo.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
  Rx<AuthPostmodel> registerPostModel = AuthPostmodel().obs;

  RxString userName = ''.obs;

  @override
  void onInit() {
    getUserName();
    super.onInit();
  }

  // register
  void registerUser(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingregister.value = true;
    registerPostModel.value = authPostModel;
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
        authPostmodel: registerPostModel.value.copyWith(otp: otp));
    result.fold((l) {
      GoRouter.of(context).pop();
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      completeLogin(context, r);
      showSnackbar(context,
          message: 'User Registered Successfully',
          backgroundColor: kneonShade,
          textColor: kblack);
    });

    loadingOtpEmail.value = false;
    Timer(
      const Duration(seconds: 2),
      () {
        getUserName();
      },
    );
  }

  void getUserName() async {
    userName.value = await SecureStorage.getName();
    log('USer name ${userName.value}');
  }

  void loginUser(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingLogin.value = true;
    registerPostModel.value = authPostModel;
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
    final result = await authRepo.otpVerificationPhone(authPostmodel: {
      'otp': otp,
      'phone_number': registerPostModel.value.phoneNumber
    });
    result.fold((l) {
      GoRouter.of(context).pop();
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      completeLogin(context, r);
      showSnackbar(context,
          message: 'User Logged In Successfully',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingOtpPhone.value = false;
    Timer(
      const Duration(seconds: 2),
      () {
        getUserName();
      },
    );
  }

  /// complete all steps related to login in this function
  void completeLogin(BuildContext context, TokenModel model) async {
    SecureStorage.saveToken(tokenModel: model);
    log('user name => ${model.name ?? ''}');
    SecureStorage.setLogin();
    // Get.find<ModuleController>().chooseModule(context, module: Module.card);
    Get.find<ModuleController>().chooseModule(context, module: Module.task);
  }

  void logOut(BuildContext context) async {
    context.go(Routes.loginPage);
    clearDataWhileLogout();
  }

  void clearDataWhileLogout() async {
    SecureStorage.clearLogin();
    authRepo.logOut();
    Get.find<CreateTaskController>().clearAllDatas();
    Get.find<TaskFolderController>().clearAllDatas();
    Get.find<TaskHomeScreenController>().clearAllDatas();
  }

  void checkLoginStatus(BuildContext context) async {
    await SecureStorage.getLogin().then((loginStatus) {
      if (!loginStatus) {
        // if user not loged in navigate to loginpage
        context.go(Routes.loginPage);
      } else {
        // change this according to the module need to be shown
        context.go(Routes.moduleSelector);
        //context.go(Routes.bizCardNavbar);
      }
    });
  }
}
