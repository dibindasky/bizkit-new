part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState(
      {required bool isLoading,
      required bool pageLoading,
      required bool hasError,
      required List<Card> cards,
      String? message,
      Card? defaultCard}) = _Initial;

  factory CardState.initial() => const CardState(
      isLoading: false, hasError: false, cards: [], pageLoading: false);
}
