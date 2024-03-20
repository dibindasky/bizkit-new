part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool hasError,
    String? message,
    GetUserInfoModel? getUserInfoModel,
    ImageModel? imageModel,
    bool? uploaded,
    UserInfoChangeResponceModel? userInfoChangeResponceModel,
    ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
  }) = _Initial;
  factory ProfileState.initial() => const ProfileState(
        isLoading: false,
        hasError: false,
      );
}
