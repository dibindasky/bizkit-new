part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState(
      {required bool hasError,
      required bool isLoading,
      required bool isBusiness,
      SuccessResponseModel? cardAdded,
      String? message,
      PersonalDetails? personalData,
      required PersonalDetailsCreate personalDetails,
      required List<ImageModel> scannedImagesCardCreation,
      ImageModel? userPhotos,
      required List<AccoladeCreate> accolades,
      required List<Category> businessCategories,
      required List<DatesToRememberCreate> datesToRemember,
      required List<SocialMediaHandleCreate> socialMedias,
      Card? currentCard,
      ScannedImageDatasModel? scannedImageDatasModel}) = _Initial;

  factory UserDataState.initial() => UserDataState(
      personalDetails: PersonalDetailsCreate(),
      hasError: false,
      isLoading: false,
      isBusiness: false,
      accolades: [],
      socialMedias: [],
      businessCategories: [],
      datesToRemember: [],
      scannedImagesCardCreation: []);
}
