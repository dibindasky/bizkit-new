part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    required bool isLoading,
    required bool pageLoading,
    required bool hasError,
    required List<CardResponse> cards,
    String? message,
    CardResponse? defaultCard,
    Card? anotherCard
  }) = _Initial;

  factory CardState.initial() =>  const CardState(cards: [],
      isLoading: false, hasError: false, pageLoading: false);
}
