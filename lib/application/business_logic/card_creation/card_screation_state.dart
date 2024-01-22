part of 'card_screation_bloc.dart';

@freezed
class CardScreationState with _$CardScreationState {
  const factory CardScreationState({
    List<File>? scanimages,
    required bool isLoading,
    required bool hasError,
    bool? success,
    String? mesasge,
    ScannedImageDatasModel? convertedText,
  }) = _Initial;

  factory CardScreationState.initial() => const CardScreationState(
        scanimages: [],
        success: false,
        isLoading: false,
        hasError: false,
      );
}
