part of 'card_second_bloc.dart';

@freezed
class CardSecondState with _$CardSecondState {
  const factory CardSecondState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    required bool cardScanFinish,
    required bool secondCardcreated,
    required bool secondCardLoading,
    required bool secondCardEventLoading,
    required bool deleteSecondCardLoading,
    required bool deleteSecondCardEventLoading,
    required bool updated,
    required bool pickImageFirst,
    required bool seondCardRestored,
    required bool secondCardDeleted,
    String? message,
    required List<ImageModel> scannedImagesSecondCardCreation,
    ScannedImageDatasModel? scannedImageDatasModel,
    ImageModel? selfieImageModel,
    required CardSecondCreateRequestModel cardSecondCreateRequestModel,
    CardSecondResponseModel? cardSecondResponseModel,
    required List<SecondCard> secondCards,
    List<SecondCard>? deleteSecondCards,
    GetSecondCardModel? getSecondCardModel,
    SuccessResponseModel? successResponseModel,
  }) = _Initial;

  factory CardSecondState.initial() => CardSecondState(
        isLoading: false,
        pickImageFirst: false,
        secondCardEventLoading: false,
        secondCardcreated: false,
        seondCardRestored: false,
        deleteSecondCardEventLoading: false,
        secondCardDeleted: false,
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