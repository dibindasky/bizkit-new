part of 'card_second_bloc.dart';

@freezed
class CardSecondState with _$CardSecondState {
  const factory CardSecondState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    String? message,
    List<SecondCard>? secondCards,
  }) = _Initial;

  factory CardSecondState.initial() => const CardSecondState(
        isLoading: false,
        isPageLoading: false,
        hasError: false,
      );
}
