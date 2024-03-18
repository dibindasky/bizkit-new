part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required LoginModel loginModel}) = Login;
  const factory AuthEvent.forgotPassword({required EmailModel emailModel}) =
      ForgotPassword;
  const factory AuthEvent.verifyforgotPassword(
      {required VerifyOtpModel verifyOtpModel}) = VerifyforgotPassword;
  const factory AuthEvent.changePassword(
      {required ChangePasswordModel changePasswordModel}) = ChangePassword;
  const factory AuthEvent.log() = Log;
  const factory AuthEvent.logOut() = LogOut;
}
