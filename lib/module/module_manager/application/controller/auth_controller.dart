// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/module/module_manager/data/sqflite/users_local_service.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/data/service/auth/auth_service.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/authentication_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthenticationController extends GetxController {
  /// api service
  AuthenticationRepo authRepo = AuthenticationService();

  /// local db sqflite
  UsersLocalRepo usersLocalRepo = UsersLocalService();

  RxBool loadingLogin = false.obs;
  RxBool loadingregister = false.obs;
  RxBool loadingOtpEmail = false.obs;
  RxBool loadingOtpPhone = false.obs;

  /// varibale to navigate ot to clal functions according to the otp type
  RxBool otpFromRegisterUser = false.obs;

  /// loading for account switching
  RxBool loadingAccountSwitching = false.obs;

  /// if account switching success
  RxBool doAccountSwitching = false.obs;

  /// loading for account fetching
  RxBool loadingAccountFetching = false.obs;

  /// model used to save data temproraly for signup
  Rx<AuthPostmodel> registerPostModel = AuthPostmodel().obs;

  /// account TokenModel list for account switching
  RxList<TokenModel> accounts = <TokenModel>[].obs;

  /// current user id
  RxString currentUserId = ''.obs;

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
    await SecureStorage.saveToken(tokenModel: model);
    log('user name => ${model.name ?? ''}');
    SecureStorage.setLogin();
    Get.find<ModuleController>().chooseModule(context, module: Module.card);
    usersLocalRepo.addUserToLocalStorageIfNotPresentInStorage(model: model);
    loadingAccountSwitching.value = false;
    getUserName();
  }

  /// if [logOut] is send as false then user will not be log out form the server
  /// user account will be avaliable forn account switching in the future use
  /// if dont want to keep account for accoutn switching call usign [logOut] false
  void logOut(BuildContext context, [bool logout = true]) async {
    context.go(Routes.loginPage);
    await clearDataWhileLogout(logout);
  }

  /// if [logout] is send as false then user will not be log out form the server
  /// user account will be avaliable forn account switching in the future use
  /// if dont want to keep account for accoutn switching call usign [logout] false
  Future<void> clearDataWhileLogout([bool logout = true]) async {
    if (logout) await authRepo.logOut();
    SecureStorage.clearLogin();
    Get.find<ModuleController>().deleteAllControlers();
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

  /// get all the accounts loagin to the device
  void getAccountList() async {
    doAccountSwitching.value = false;
    accounts.value = [];
    loadingAccountFetching.value = true;
    currentUserId.value = await SecureStorage.getUserId() ?? '';
    final result = await usersLocalRepo.getUsersFromLocalStorage();
    result.fold((l) => loadingAccountFetching.value = false, (r) {
      accounts.value = r;
      loadingAccountFetching.value = false;
    });
  }

  /// switch account
  void switchAccountLogin(BuildContext context,
      {required String userId}) async {
    try {
      loadingAccountSwitching.value = true;
      doAccountSwitching.value = false;
      Get.find<ModuleController>().deleteAllControlers();
      final uid = await SecureStorage.getUserId();
      if (uid == userId) return;
      final result = await usersLocalRepo.getUserWithUid(userId: userId);
      result.fold((l) => log('get user id false'), (r) {
        log('get user and token succes ');
        completeLogin(context, r);
        doAccountSwitching.value = true;
      });
    } catch (e) {
      return;
    }
  }
}
