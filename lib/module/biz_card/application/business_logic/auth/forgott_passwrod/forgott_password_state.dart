part of 'forgott_password_bloc.dart';

@freezed
class ForgottPasswordState with _$ForgottPasswordState {
  const factory ForgottPasswordState({
    required bool isLoading,
    required bool hasError,
    required bool otpSend,
    required bool otpVerificationError,
    required bool otpVerifiedForgotPassword,
    String? message,
    required bool passwordChange,
  }) = _Initial;
  factory ForgottPasswordState.initial() => const ForgottPasswordState(
        isLoading: false,
        passwordChange: false,
        hasError: false,
        otpSend: false,
        otpVerificationError: false,
        otpVerifiedForgotPassword: false,
      );
}
