import 'dart:async';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
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
    on<Login>(login);
    on<ForgotPassword>(forgotPassword);
    on<ChangePassword>(changePassword);
    on<VerifyforgotPassword>(verifyForgotPassword);
    on<Log>(log);
    on<LogOut>(logOut);
  }

  FutureOr<void> log(Log event, emit) async {
    final result = await userLocalService.getUserData();
    String userName = '';
    result.fold(
        (l) => userName = '',
        (r) => userName =
            r.isNotEmpty && r.first.name != null ? r.first.name ?? '' : '');
    return emit(state.copyWith(
        isLogin: await SecureStorage.getLogin(), userName: userName));
  }

  FutureOr<void> logOut(LogOut event, emit) async =>
      await SecureStorage.clearLogin();

  FutureOr<void> login(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        loginResponseModel: null));
    print('login request send');
    final result = await authRepo.login(loginModel: event.loginModel);
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
        print(loginResponseModel.toJson());
        emit(
          state.copyWith(
            isLoading: false,
            loginResponseModel: loginResponseModel,
            message: loginResponseModel.message ?? 'login successfully',
          ),
        );
        print('saveToken');
        print(loginResponseModel.accessToken);
        await SecureStorage.saveToken(
          tokenModel: TokenModel(
              id: loginResponseModel.user?.id,
              accessToken: loginResponseModel.accessToken,
              refreshToken: loginResponseModel.refreshToken),
        );
        print('sqflite');
        if (loginResponseModel.user != null) {
          await userLocalService.addUser(loginResponseModel.user!);
        }
        print('setLogin');
        await SecureStorage.setLogin();
        print('set role');
        await SecureStorage.setRole(
            isBusiness: loginResponseModel.user!.isBusiness!);
      },
    );
  }

  FutureOr<void> forgotPassword(
      ForgotPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        hasError: false,
        otpVerificationError: false,
        otpSend: false));
    final result = await authRepo.forgotPassword(emailModel: event.emailModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(
            isLoading: false,
            message: successResponseModel.message,
            otpSend: true),
      ),
    );
  }

  FutureOr<void> verifyForgotPassword(
      VerifyforgotPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        otpVerificationError: false,
        hasError: false,
        otpSend: false,
        otpVerifiedForgotPassword: false));
    final result = await authRepo.verifyOtpForgotPassword(
        verifyOtpModel: event.verifyOtpModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            otpVerificationError: true,
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(
            isLoading: false,
            message: successResponseModel.message,
            otpVerifiedForgotPassword: true),
      ),
    );
  }

  FutureOr<void> changePassword(
      ChangePassword event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
          isLoading: true,
          message: null,
          hasError: false,
          otpVerificationError: false),
    );
    final result = await authRepo.changePassword(
        changePasswordModel: event.changePasswordModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(isLoading: false, message: successResponseModel.message),
      ),
    );
  }
}
