part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {required bool isLoading,
      required bool hasError,
      required bool otpSend,
      required bool otpVerified,
      required bool otpVerifiedForgotPassword,
      String? message,
      SignUpResponseModel? signUpResponseModel,
      LoginResponseModel? loginResponseModel}) = _Initial;

  factory AuthState.initial() => const AuthState(
      isLoading: false,
      hasError: false,
      otpSend: false,
      otpVerified: false,
      otpVerifiedForgotPassword: false);
}
