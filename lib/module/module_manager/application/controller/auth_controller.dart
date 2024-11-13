import 'dart:async';
import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/module/module_manager/data/local_storage/local_storage_preference.dart';
import 'package:bizkit/module/module_manager/data/sqflite/users_local_service.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/data/service/auth/auth_service.dart';
import 'package:bizkit/module/module_manager/domain/model/auth/auth_postmodel/auth_postmodel.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/authentication_repo/authentication_repo.dart';
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
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      otpFromRegisterUser.value = true;
      GoRouter.of(context).pushNamed(Routes.otpPage, extra: {'email': true});
      showSnackbar(context,
          message: r.message ?? 'Otp send to your mail id',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingregister.value = false;
  }

  /// verify email otp otp for regestration
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

  /// get user name from local storage
  void getUserName() async {
    userName.value = await SecureStorage.getName();
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
      showSnackbar(context,
          message: l.message ?? errorMessage,
          backgroundColor: kred,
          textColor: kblack);
    }, (r) {
      log('Otp resent successs');
      otpFromRegisterUser.value = false;
      GoRouter.of(context)
          .pushNamed(Routes.otpPage, extra: {'email': emailLogin});
      showSnackbar(context,
          message:
              'Otp send to your registered ${emailLogin ? 'email address' : 'mobile number'}',
          backgroundColor: kneonShade,
          textColor: kblack);
    });
    loadingLogin.value = false;
  }

  /// verify otp login using email and phone number
  void verifyOtpLogin(BuildContext context,
      {required String otp, required bool isEmail}) async {
    loadingOtpPhone.value = true;
    final result = await authRepo.otpVerificationPhone(
        authPostmodel: isEmail
            ? {'otp': otp, 'email': registerPostModel.value.email}
            : {
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

  /// login using [password] and ([email] / [phone])
  void loginUsingPassword(BuildContext context,
      {required AuthPostmodel authPostModel}) async {
    loadingLoginPassword.value = true;
    final data =
        await authRepo.loginUsingPassword(authPostmodel: authPostModel);
    data.fold((l) {
      loadingLoginPassword.value = false;
    }, (r) {
      completeLogin(context, r);
      showSnackbar(context,
          message: 'User Logged In Successfully',
          backgroundColor: kneonShade,
          textColor: kblack);
      loadingLoginPassword.value = false;
    });
  }

  /// complete all steps related to login in this function
  void completeLogin(BuildContext context, TokenModel model) async {
    await SecureStorage.saveToken(tokenModel: model);
    log('user name => ${model.name ?? ''}');
    SecureStorage.setLogin();
    final module = await getLastUsedModule();
    Get.find<ModuleController>().chooseModule(context, module: module);
    usersLocalRepo.addUserToLocalStorageIfNotPresentInStorage(
        model: model.copyWith(logoutFromDevice: 'login'));
    loadingAccountSwitching.value = false;
    getUserName();
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
    await clearDataWhileLogout(logout);
  }

  /// if [logout] is send as false then user will not be log out form the server
  /// user account will be avaliable forn account switching in the future use
  /// if dont want to keep account for accoutn switching call usign [logout] false
  Future<void> clearDataWhileLogout([bool logout = true]) async {
    if (logout) {
      await authRepo.logOut();
      final model = await SecureStorage.getToken();
      usersLocalRepo.updateUserInLocalStorage(
          model: model.copyWith(logoutFromDevice: 'logout'));
    }
    SecureStorage.clearLogin();
    Get.find<ModuleController>().deleteAllControlers();
  }

  checkOnBoarding(BuildContext context) async {
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
