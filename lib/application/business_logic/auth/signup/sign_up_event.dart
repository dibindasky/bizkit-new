part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.registerBusiness(
      {required SignUpModel signUpModel}) = RegisterBusiness;
  const factory SignUpEvent.registerIndividual(
          {required SignUpIndivudalModel signUpIndivudalModel}) =
      RegisterIndividual;
  const factory SignUpEvent.sendOtp(
      {required EmailModel emailModel, required bool isBusiness}) = SendOtp;
  const factory SignUpEvent.verifyOtp(
      {required VerifyOtpModel verifyOtpModel,
      SignUpModel? signUpModel,
      SignUpIndivudalModel? signUpIndivudalModel,
      required bool isBusiness}) = VerifyOtp;
}
