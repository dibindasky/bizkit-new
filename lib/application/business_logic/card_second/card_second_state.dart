part of 'card_second_bloc.dart';

@freezed
class CardSecondState with _$CardSecondState {
  const factory CardSecondState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    required bool cardScanFinish,
    required bool secondCardLoading,
    required bool deleteSecondCardLoading,
    required bool updated,
    String? message,
    required List<ImageModel> scannedImagesSecondCardCreation,
    ScannedImageDatasModel? scannedImageDatasModel,
    ImageModel? selfieImageModel,
    required CardSecondCreateRequestModel cardSecondCreateRequestModel,
    CardSecondResponseModel? cardSecondResponseModel,
    required List<SecondCard> secondCards,
    List<SecondCard>? deleteSecondCards,
    SuccessResponseModel? successResponseModel,
  }) = _Initial;

  factory CardSecondState.initial() => CardSecondState(
        isLoading: false,
        isPageLoading: false,
        updated: false,
        deleteSecondCardLoading: false,
        secondCardLoading: false,
        cardSecondCreateRequestModel: CardSecondCreateRequestModel(),
        hasError: false,
        secondCards: [],
        cardScanFinish: false,
        scannedImagesSecondCardCreation: [],
      );
}
