part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required LoginModel loginModel}) = _Login;
  const factory AuthEvent.register({required SignUpModel signUpModel}) =
      _Register;
  const factory AuthEvent.sendOtp({required EmailModel emailModel}) = _SendOtp;
  const factory AuthEvent.verifyOtp({required VerifyOtpModel verifyOtpModel}) =
      _VerifyOtp;
  const factory AuthEvent.forgotPassword({required EmailModel emailModel}) =
      _ForgotPassword;
  const factory AuthEvent.verifyforgotPassword(
      {required VerifyOtpModel verifyOtpModel}) = _VerifyforgotPassword;
  const factory AuthEvent.changePassword(
      {required ChangePasswordModel changePasswordModel}) = _ChangePassword;
}
