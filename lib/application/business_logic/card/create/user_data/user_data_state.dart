part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState(
      {required bool hasError,
      required bool isLoading,
      required bool isBusiness,
      required bool accoladeLoading,
      required bool accoladeAdded,
      required bool accoladeDeleteLoading,
      required bool datesToRememberLoading,
      required bool datesToRememberAdded,
      required bool datesToRememberDeleteLoading,
      required bool socialMediaLoading,
      required bool socialMediaAdded,
      required bool socialMediaDeleteLoading,
      required bool cardAdded,
      String? message,
      PersonalDetails? personalData,
      required PersonalDetails personalDetails,
      required List<ImageModel> scannedImagesCardCreation,
      ImageModel? userPhotos,
      required List<Accolade> accolades,
      required List<Category> businessCategories,
      required List<DatesToRemember> datesToRemember,
      required List<SocialMediaHandle> socialMedias,
      Card? currentCard,
      ScannedImageDatasModel? scannedImageDatasModel}) = _Initial;

  factory UserDataState.initial() => UserDataState(
      personalDetails: PersonalDetails(),
      hasError: false,
      isLoading: false,
      isBusiness: false,
      accoladeDeleteLoading: false,
      accoladeLoading: false,
      accoladeAdded: false,
      datesToRememberAdded: false,
      socialMediaAdded: false,
      datesToRememberDeleteLoading: false,
      datesToRememberLoading: false,
      socialMediaDeleteLoading: false,
      cardAdded: false,
      socialMediaLoading: false,
      accolades: [],
      socialMedias: [],
      businessCategories: [],
      datesToRemember: [],
      scannedImagesCardCreation: []);
}
