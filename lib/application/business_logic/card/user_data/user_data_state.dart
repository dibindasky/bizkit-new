part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState(
      {required bool hasError,
      required bool isLoading,
      String? message,
      required PersonalDetails personalDetails,
      required List<ImageModel> scannedImagesCardCreation,
      required List<ImageModel> userPhotos,
      required List<Accolade> accolades,
      required List<DatesToRemember> datesToRemember,
      required List<SocialMediaHandle> socialMedias,
      ScannedImageDatasModel? scannedImageDatasModel}) = _Initial;

  factory UserDataState.initial() => UserDataState(
      personalDetails: PersonalDetails(),
      hasError: false,
      isLoading: false,
      userPhotos: [],
      accolades: [],
      socialMedias: [],
      datesToRemember: [],
      scannedImagesCardCreation: []);
}
