part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required bool isLoading,
      required bool hasError,
      required bool otpSendBusiness,
      required bool otpVerifiedBusiness,
      required bool otpSendIndividual,
      required bool otpVerifiedIndividual,
      required bool otpIndividualError,
      required bool otpBusinessError,
      String? message,
      SignUpResponseModel? signUpResponseModel}) = _Initial;

  factory SignUpState.initial() => const SignUpState(
      isLoading: false,
      hasError: false,
      otpSendBusiness: false,
      otpSendIndividual: false,
      otpVerifiedBusiness: false,
      otpBusinessError: false,
      otpIndividualError: false,
      otpVerifiedIndividual: false);
}
