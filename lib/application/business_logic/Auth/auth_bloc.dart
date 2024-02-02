import 'dart:async';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_response_model/sign_up_response_model.dart';
import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final LocalService localService;

  AuthBloc(this.authRepo, this.localService) : super(AuthState.initial()) {
    on<_Login>(login);
    on<_Register>(register);
  }

  FutureOr<void> register(event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        signUpResponseModel: null));
    final result = await authRepo.register(signUpModel: event.signUpModel);
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage)), (signUpResponseModel) {
      emit(state.copyWith(
          isLoading: false, signUpResponseModel: signUpResponseModel));
    });
  }

  FutureOr<void> login(event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        loginResponseModel: null));
    final result = await authRepo.login(loginModel: event.loginModel);
    result.fold(
      (failure) => emit(state.copyWith(
          isLoading: false,
          hasError: true,
          message: failure.message ?? errorMessage)),
      (loginResponseModel) async {
        await SecureStorage.saveToken(
          tokenModel: TokenModel(
              accessToken: loginResponseModel.accessToken,
              refreshToken: loginResponseModel.refreshToken),
        );
        if (loginResponseModel.user != null) {
          await localService.addUser(loginResponseModel.user!);
        }
        await SecureStorage.setLogin();
        emit(
          state.copyWith(
            isLoading: false,
            loginResponseModel: loginResponseModel,
            message: loginResponseModel.message ?? 'login successfully',
          ),
        );
      },
    );
  }
}
