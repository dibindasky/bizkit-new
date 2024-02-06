part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required LoginModel loginModel}) = Login;
  const factory AuthEvent.registerBusiness({required SignUpModel signUpModel}) =
      RegisterBusiness;
  const factory AuthEvent.registerIndividual({required SignUpIndivudalModel signUpIndivudalModel}) =
      RegisterIndividual;
  const factory AuthEvent.sendOtp({required EmailModel emailModel}) = SendOtp;
  const factory AuthEvent.verifyOtp({required VerifyOtpModel verifyOtpModel}) =
      VerifyOtp;
  const factory AuthEvent.forgotPassword({required EmailModel emailModel}) =
      ForgotPassword;
  const factory AuthEvent.verifyforgotPassword(
      {required VerifyOtpModel verifyOtpModel}) = VerifyforgotPassword;
  const factory AuthEvent.changePassword(
      {required ChangePasswordModel changePasswordModel}) = ChangePassword;
  const factory AuthEvent.showValidateError() = ShowValidateError;
  const factory AuthEvent.log() = Log;
}
