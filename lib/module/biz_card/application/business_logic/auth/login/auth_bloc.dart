import 'dart:async';
import 'dart:io';
import 'package:bizkit/core/model/token/token_model.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/auth_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/user/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final UserLocalRepo userLocalService;

  AuthBloc(this.authRepo, this.userLocalService) : super(AuthState.initial()) {
    on<OnBoardskip>(onBoardskip);
    on<Login>(login);
    on<Log>(log);
    on<LogOut>(logOut);
  }

  FutureOr<void> onBoardskip(OnBoardskip event, emit) async {
    await SecureStorage.setOnBoardBool();
  }

  FutureOr<void> log(Log event, emit) async {
    emit(state.copyWith(
      onBoardSkipBool: await SecureStorage.getOnBoardBool(),
      isLogin: await SecureStorage.getLogin(),
      userName: await SecureStorage.getName(),
    ));
  }

  FutureOr<void> logOut(LogOut event, emit) async {
    await SecureStorage.clearLogin();
    await SecureStorage.setOnBoardBool();
  }

  FutureOr<void> login(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      message: null,
      loginResponseModel: null,
    ));
    await FirebaseMessaging.instance.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();
    print('Firebase Device token ====> $token');
    final LoginModel model = LoginModel(
        email: event.loginModel.email,
        password: event.loginModel.password,
        deviceToken: token,
        deviceType: Platform.isAndroid ? 1 : 2,
        deviceId:
            '${Platform.isAndroid ? 'Android' : 'ios'} device ${DateTime.now().toString()}'
        // deviceId: await DeviceInformation.getDeviceInformation()
        );
    print('login request send');
    final result = await authRepo.login(loginModel: model);
    result.fold(
      (failure) {
        print('login failed');
        emit(
          state.copyWith(
              isLoading: false,
              hasError: true,
              message: failure.message ?? errorMessage),
        );
      },
      (loginResponseModel) async {
        print('login success');
        print('saveToken');
        print(loginResponseModel.accessToken);
        print(loginResponseModel.user!.toJson());
        SecureStorage.saveToken(
          tokenModel: TokenModel(
              id: loginResponseModel.user?.id,
              accessToken: loginResponseModel.accessToken,
              refreshToken: loginResponseModel.refreshToken),
        );
        SecureStorage.setHasCard(
            hasCard: loginResponseModel.user?.hasCard ?? false);
        print(loginResponseModel.toJson());
        emit(
          state.copyWith(
            userName: loginResponseModel.user?.name ??
                loginResponseModel.user?.companyName ??
                '',
            isFirstLogin: loginResponseModel.user?.isLogined ?? true,
            hasCard: loginResponseModel.user?.hasCard ?? true,
            isLoading: false,
            loginResponseModel: loginResponseModel,
            message: loginResponseModel.message ?? 'login successfully',
          ),
        );
        if (loginResponseModel.user != null) {
          await userLocalService.addUser(loginResponseModel.user!);
        }
        await SecureStorage.setLogin(
            name: loginResponseModel.user?.name ??
                loginResponseModel.user?.companyName ??
                '',
            isVerified: loginResponseModel.user?.isVerified ?? false);
        await SecureStorage.setRole(
            isBusiness: loginResponseModel.user?.isBusiness ?? true);
        await SecureStorage.setHasReminder(
            hasReminder: loginResponseModel.user?.hasCard ?? false);
        SecureStorage.setUserDetails(user: loginResponseModel.user ?? User());
      },
    );
  }
}
