import 'dart:async';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_response_model/sign_up_response_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;
  SignUpBloc(this.authRepo) : super(SignUpState.initial()) {
    on<RegisterBusiness>(registerBusiness);
    on<RegisterIndividual>(registerIndividual);
    on<SendOtp>(sendOtp);
    on<VerifyOtp>(verifyOtp);
  }

  FutureOr<void> registerBusiness(
      RegisterBusiness event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(
          isLoading: true,
          hasError: false,
          message: null,
          otpIndividualError: false,
          otpBusinessError: false,
          signUpResponseModel: null),
    );
    final result =
        await authRepo.registerBusiness(signUpModel: event.signUpModel);
    result.fold(
        (failure) => emit(
              state.copyWith(
                  isLoading: false,
                  hasError: true,
                  message: failure.message ?? errorMessage),
            ), (signUpResponseModel) {
      emit(
        state.copyWith(
            isLoading: false, signUpResponseModel: signUpResponseModel),
      );
    });
  }

  FutureOr<void> registerIndividual(
      RegisterIndividual event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(
          isLoading: true,
          hasError: false,
          message: null,
          otpIndividualError: false,
          otpBusinessError: false,
          signUpResponseModel: null),
    );
    final result = await authRepo.registerIndivudual(
        signUpIndivudalModel: event.signUpIndivudalModel);
    result.fold((failure) {
      emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      );
    }, (signUpResponseModel) {
      emit(
        state.copyWith(
            message: signUpResponseModel.message,
            isLoading: false,
            signUpResponseModel: signUpResponseModel),
      );
    });
  }

  FutureOr<void> sendOtp(SendOtp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        hasError: false,
        otpIndividualError: false,
        otpBusinessError: false,
        otpSendIndividual: false,
        otpSendBusiness: false));
    final result = await authRepo.sendOtp(emailModel: event.emailModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) {
        emit(
          state.copyWith(
              isLoading: false,
              message: successResponseModel.message,
              otpSendBusiness: event.isBusiness ? true : false,
              otpSendIndividual: !event.isBusiness ? true : false),
        );
      },
    );
  }

  Future<FutureOr<void>> verifyOtp(
      VerifyOtp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        otpIndividualError: false,
        otpBusinessError: false,
        hasError: false,
        otpSendIndividual: false,
        otpSendBusiness: false));
    final result =
        await authRepo.verifyOtp(verifyOtpModel: event.verifyOtpModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) {
        if (event.isBusiness) {
          add(SignUpEvent.registerBusiness(signUpModel: event.signUpModel!));
        } else {
          add(SignUpEvent.registerIndividual(
              signUpIndivudalModel: event.signUpIndivudalModel!));
        }
      },
    );
  }
}
