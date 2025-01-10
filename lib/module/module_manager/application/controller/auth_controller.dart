// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/module/module_manager/data/local_storage/local_storage_preference.dart';
import 'package:bizkit/module/module_manager/data/sqflite/users_local_service.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/packages/device_info/device_ino.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/data/service/auth/auth_service.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/authentication_repo/authentication_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'profile_controller/profile_controller.dart';

class AuthenticationController extends GetxController {
  /// api service
  AuthenticationRepo authRepo = AuthenticationService();

  /// local db sqflite
  UsersLocalRepo usersLocalRepo = UsersLocalService();

  RxBool loadingLogin = false.obs;
  RxBool loadingregister = false.obs;
  RxBool loadingOtpEmail = false.obs;
  RxBool loadingOtpPhone = false.obs;

  /// loading for pasword login
  RxBool loadingLoginPassword = false.obs;

  /// varibale to navigate ot to clal functions according to the otp type
  RxBool otpFromRegisterUser = false.obs;

  /// loading for account switching
  RxBool loadingAccountSwitching = false.obs;

  /// if account switching success
  RxBool doAccountSwitching = false.obs;

  /// loading for account fetching
  RxBool loadingAccountFetching = false.obs;

  /// model used to save data temproraly for signup and login
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

  /// register user to bizkit
  void registerUser(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingregister.value = true;
    registerPostModel.value = authPostModel;
    final result = await authRepo.registerUser(
        authPostmodel: AuthPostmodel(
            email: authPostModel.email,
            phoneNumber: authPostModel.phoneNumber));
    result.fold((l) {
      showCustomToast(
        message: l.message ?? errorMessage,
        backgroundColor: kred,
      );
    }, (r) {
      otpFromRegisterUser.value = true;
      GoRouter.of(context).pushNamed(Routes.otpPage, extra: {'email': true});
      showCustomToast(message: r.message ?? 'Otp send to your mail id');
    });
    loadingregister.value = false;
  }

  /// verify email otp otp for regestration
  void verifyOtpEmailRegestration(BuildContext context,
      {required String otp}) async {
    loadingOtpEmail.value = true;
    final result = await authRepo.otpVerification(
        authPostmodel: registerPostModel.value.copyWith(
            otp: otp,
            deviceId: await DeviceInformation.getDeviceInformation()));
    result.fold((l) {
      GoRouter.of(context).pop();
      showCustomToast(
        message: l.message ?? errorMessage,
        backgroundColor: kred,
      );
    }, (r) {
      completeLogin(context, r);

      showCustomToast(
        message: 'User Registered Successfully',
      );
      GoRouter.of(context)
          .pushReplacementNamed(Routes.varificationScreen, extra: false);
      // showSnackbar(context,
      //     message: 'User Registered Successfully',
      //     backgroundColor: kneonShade,
      //     textColor: kblack);
    });

    loadingOtpEmail.value = false;
    Timer(
      const Duration(seconds: 2),
      () {
        getUserName();
      },
    );
  }

  /// get user name from local storage
  void getUserName() async {
    final token = await SecureStorage.getToken();
    userName.value = token.name ?? '';
    currentUserId.value = token.uid ?? '';
    log('USer name ${userName.value}');
  }

  /// login user using email and phone
  void loginUser(BuildContext context,
      {required AuthPostmodel authPostModel, required bool emailLogin}) async {
    loadingLogin.value = true;
    registerPostModel.value = authPostModel;
    final result = await authRepo.loginUser(authPostmodel: authPostModel);
    result.fold((l) {
      log('Otp resent failed');
      showCustomToast(
        message: l.message ?? errorMessage,
        backgroundColor: kred,
      );
    }, (r) {
      log('Otp resent successs');
      otpFromRegisterUser.value = false;
      GoRouter.of(context)
          .pushNamed(Routes.otpPage, extra: {'email': emailLogin});
      showCustomToast(
        message:
            'Otp send to your registered ${emailLogin ? 'email address' : 'mobile number'}',
      );
    });
    loadingLogin.value = false;
  }

  /// verify otp login using email and phone number
  void verifyOtpLogin(BuildContext context,
      {required String otp, required bool isEmail}) async {
    loadingOtpPhone.value = true;
    final String deviceId = await DeviceInformation.getDeviceInformation();
    final result = await authRepo.otpVerificationPhone(
        authPostmodel: isEmail
            ? {
                'otp': otp,
                'email': registerPostModel.value.email,
                'device_id': deviceId
              }
            : {
                'otp': otp,
                'phone_number': registerPostModel.value.phoneNumber,
                'device_id': deviceId
              });
    result.fold((l) {
      GoRouter.of(context).pop();
      showCustomToast(
        message: l.message ?? errorMessage,
        backgroundColor: kred,
      );
    }, (r) {
      completeLogin(context, r);
      GoRouter.of(context)
          .pushReplacementNamed(Routes.varificationScreen, extra: true);
    });
    loadingOtpPhone.value = false;
    Timer(
      const Duration(seconds: 2),
      () {
        getUserName();
      },
    );
  }

  /// login using [password] and ([email] / [phone])
  void loginUsingPassword(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingLoginPassword.value = true;
    authPostModel.deviceId = await DeviceInformation.getDeviceInformation();
    final data =
        await authRepo.loginUsingPassword(authPostmodel: authPostModel);
    data.fold((l) {
      loadingLoginPassword.value = false;
    }, (r) {
      completeLogin(context, r);
      GoRouter.of(context)
          .pushReplacementNamed(Routes.varificationScreen, extra: false);
      showCustomToast(
        message: 'User Logged In Successfully',
      );
      loadingLoginPassword.value = false;
    });
  }

  /// complete all steps related to login in this function
  void completeLogin(BuildContext context, TokenModel model) async {
    await SecureStorage.saveToken(tokenModel: model);
    log('user name => ${model.name ?? ''}');
    log('user data =------------===> ${model.toJson()}');
    await SecureStorage.setLogin();
    if (loadingAccountSwitching.value) {
      await chooseModule(context);
    }
    await usersLocalRepo.addUserToLocalStorageIfNotPresentInStorage(
        model: model.copyWith(logoutFromDevice: 'login'));
    await Get.find<AccessController>().initUserData();
    loadingAccountSwitching.value = false;
    getUserName();
  }

  ///choose module and navigate to home screen.
  Future<void> chooseModule(BuildContext context) async {
    final module = await getLastUsedModule();
    final moduleController = Get.find<ModuleController>();
    moduleController.clearCurrentModule();
    await moduleController.chooseModule(context, module: module);
  }

  /// will return the last used [Module] by the user if not will return [null]
  Future<Module?> getLastUsedModule() async {
    final module = await LocalStoragePreference.getLastUsedModule();
    return getModuleFromString(module);
  }

  /// if [logOut] is send as false then user will not be log out form the server
  /// user account will be avaliable forn account switching in the future use
  /// if dont want to keep account for accoutn switching call usign [logOut] false
  void logOut(BuildContext context, [bool logout = true]) async {
    context.go(Routes.loginPage);
    Get.find<ModuleController>().currentModule.value = Module.none;
    await clearDataWhileLogout(logout);
  }

  /// if [logout] is send as false then user will not be log out form the server
  /// user account will be avaliable forn account switching in the future use
  /// if dont want to keep account for accoutn switching call usign [logout] false
  Future<void> clearDataWhileLogout([bool logout = true]) async {
    if (logout) {
      await authRepo.logOut();
      final model = await SecureStorage.getToken();
      await usersLocalRepo.updateUserInLocalStorage(
          model: model.copyWith(logoutFromDevice: 'logout'));
    }
    await SecureStorage.clearLogin();
    await Get.find<ModuleController>().deleteAllControlers();
  }

  Future<void> checkOnBoarding(BuildContext context) async {
    bool logedOrNot = await SecureStorage.getOnBoardBool();
    logedOrNot
        ? checkLoginStatus(context)
        : GoRouter.of(context).pushReplacementNamed(Routes.onBoarding);
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    await SecureStorage.getLogin().then((loginStatus) async {
      if (!loginStatus) {
        // if user not loged in navigate to loginpage
        context.go(Routes.loginPage);
      } else {
        final module = await getLastUsedModule();
        await Get.find<AccessController>().initUserData();
        Get.find<ModuleController>().chooseModule(context, module: module);
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
      final uid = await SecureStorage.getUserId();
      if (uid == userId) return;
      Get.find<ModuleController>().deleteAllControlers();
      Get.find<ProfileController>().clearData();
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
