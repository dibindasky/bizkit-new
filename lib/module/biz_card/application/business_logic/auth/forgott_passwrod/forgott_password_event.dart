part of 'forgott_password_bloc.dart';

@freezed
class ForgottPasswordEvent with _$ForgottPasswordEvent {
  const factory ForgottPasswordEvent.started() = _Started;
  const factory ForgottPasswordEvent.forGottPasswordEmailVerify({
    required EmailModel emailModel,
  }) = ForGottPasswordEmailVerify;
  const factory ForgottPasswordEvent.verifyforgotPasswordOTPEmail({
    required VerifyOtpModel verifyOtpModel,
  }) = VerifyforgotPasswordOTPEmail;
  const factory ForgottPasswordEvent.forgottPassword({
    required ChangePasswordModel changePasswordModel,
  }) = ForgottPassword;
}
