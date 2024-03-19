part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.pickImageScanning({required bool camera}) =
      PickImageScanning;
  const factory ProfileEvent.getProfile({required bool isLoad}) = GetProfile;
  const factory ProfileEvent.editProfile({
    required UserInfoChangeRequestModel userInfoChangeRequestModel,
  }) = EditProfile;
  const factory ProfileEvent.deleteProfile() = DeleteProfile;
  const factory ProfileEvent.userInfoChange({
    required UserInfoChangeRequestModel userNameChanginRequestModel,
  }) = UserInfoChange;
  const factory ProfileEvent.resetPasswod({
    required ForgottPasswordRequestModel forgottPasswordRequestModel,
  }) = ResetPasswod;
  const factory ProfileEvent.reportAProblem({
    required ReportAProblemRequestModel reportAProblemRequestModel,
  }) = ReportAProblem;
  const factory ProfileEvent.getArchievedCards() = GetArchievedCards;
  const factory ProfileEvent.getArchievedCardsEvent() = GetArchievedCardsEvent;
  const factory ProfileEvent.getBlockeConnections() = GetBlockeConnections;
  const factory ProfileEvent.getBlockeConnectionsEvent() =
      GgetBlockeConnectionsEvent;
}
