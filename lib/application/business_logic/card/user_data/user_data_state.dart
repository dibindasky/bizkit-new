part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState(
      {required bool hasError,
      required bool isLoading,
      String? message,
      required List<ImageModel> scannedImagesCardCreation,
      ScannedImageDatasModel? scannedImageDatasModel}) = _Initial;

  factory UserDataState.initial() => const UserDataState(
      hasError: false, isLoading: false, scannedImagesCardCreation: []);
}
