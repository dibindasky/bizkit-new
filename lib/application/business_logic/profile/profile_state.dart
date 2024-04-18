part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool questionLoading,
    required bool hasError,
    required bool profileLoading,
    required bool isBusiness,
    String? message,
    String? userName,
    required bool profileNameUpdated,
    GetUserInfoModel? getUserInfoModel,
    ImageModel? imageModel,
    bool? uploaded,
    SuccessResponseModel? successResponseModel,
    UpdateUserInfoModel? updateUserInfoModel,
    ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
    List<Questions>? questionList,
  }) = _Initial;
  factory ProfileState.initial() => const ProfileState(
        isLoading: false,
        isBusiness: false,
        profileNameUpdated: false,
        profileLoading: false,
        questionLoading: false,
        hasError: false,
      );
}
