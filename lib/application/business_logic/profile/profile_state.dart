part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool questionLoading,
    required bool hasError,
    String? message,
    GetUserInfoModel? getUserInfoModel,
    ImageModel? imageModel,
    bool? uploaded,
    UpdateUserInfoModel? userInfoChangeResponceModel,
    ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
    List<Questions>? questionList,
  }) = _Initial;
  factory ProfileState.initial() => const ProfileState(
        isLoading: false,
        questionLoading: false,
        hasError: false,
      );
}
