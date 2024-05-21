import 'dart:async';
import 'package:bizkit/module/biz_card/domain/repository/service/auth_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'forgott_password_event.dart';
part 'forgott_password_state.dart';
part 'forgott_password_bloc.freezed.dart';

@injectable
class ForgottPasswordBloc
    extends Bloc<ForgottPasswordEvent, ForgottPasswordState> {
  final AuthRepo authRepo;
  TextEditingController forgottpasswordEmail = TextEditingController();
  TextEditingController forgottPasswordOTP = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  ForgottPasswordBloc(this.authRepo) : super(ForgottPasswordState.initial()) {
    on<ForGottPasswordEmailVerify>(forGottPasswordEmailVerify);
    on<ForgottPassword>(forgottPassword);
    on<VerifyforgotPasswordOTPEmail>(verifyforgotPasswordOTPEmail);
  }

  FutureOr<void> forGottPasswordEmailVerify(ForGottPasswordEmailVerify event,
      Emitter<ForgottPasswordState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      message: null,
      hasError: false,
      otpVerificationError: false,
      otpSend: false,
    ));
    final result =
        await authRepo.forgotPasswordemailVerify(emailModel: event.emailModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          otpSend: false,
          message: failure.message ?? errorMessage,
        ),
      ),
      (successResponseModel) => emit(
        state.copyWith(
          isLoading: false,
          message: successResponseModel.message,
          otpSend: true,
        ),
      ),
    );
  }

  FutureOr<void> verifyforgotPasswordOTPEmail(
      VerifyforgotPasswordOTPEmail event,
      Emitter<ForgottPasswordState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        otpVerificationError: false,
        hasError: false,
        otpSend: false,
        otpVerifiedForgotPassword: false));
    final result = await authRepo.forgotPasswordVerifyOtp(
        verifyOtpModel: event.verifyOtpModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          otpVerificationError: true,
          isLoading: false,
          hasError: true,
          message: failure.message ?? errorMessage,
        ),
      ),
      (successResponseModel) => emit(
        state.copyWith(
          isLoading: false,
          message: successResponseModel.message,
          otpVerifiedForgotPassword: true,
        ),
      ),
    );
  }

  FutureOr<void> forgottPassword(
      ForgottPassword event, Emitter<ForgottPasswordState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        message: null,
        hasError: false,
        otpVerificationError: false,
      ),
    );
    final result = await authRepo.forgottPassword(
        changePasswordModel: event.changePasswordModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          message: failure.message ?? errorMessage,
        ),
      ),
      (successResponseModel) => emit(
        state.copyWith(
          isLoading: false,
          message: successResponseModel.message,
          passwordChange: true,
        ),
      ),
    );
  }
}
