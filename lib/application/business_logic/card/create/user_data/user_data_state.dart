part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState(
      {required bool hasError,
      required bool isLoading,
      SuccessResponseModel? cardAdded,
      String? message,
      required PersonalDetailsCreate personalDetails,
      required List<ImageModel> scannedImagesCardCreation,
      required List<ImageModel> userPhotos,
      required List<AccoladeCreate> accolades,
      required List<DatesToRememberCreate> datesToRemember,
      required List<SocialMediaHandleCreate> socialMedias,
      ScannedImageDatasModel? scannedImageDatasModel}) = _Initial;

  factory UserDataState.initial() => UserDataState(
      personalDetails: PersonalDetailsCreate(),
      hasError: false,
      isLoading: false,
      userPhotos: [],
      accolades: [],
      socialMedias: [],
      datesToRemember: [],
      scannedImagesCardCreation: []);
}
