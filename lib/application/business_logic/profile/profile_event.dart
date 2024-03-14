part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfile() = GetProfile;
  const factory ProfileEvent.editProfile({
    required ProfileUpdateRequestModel profileUpdateRequestModel,
    required bool isFrom,
  }) = EditProfile;
  const factory ProfileEvent.deleteProfile() = DeleteProfile;
}
