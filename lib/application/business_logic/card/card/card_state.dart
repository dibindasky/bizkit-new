part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState(
      {required bool isLoading,
      required bool pageLoading,
      required bool hasError,
      required bool businessUser,
      required bool archiveCardLoading,
      required bool deleteCardLoading,
      required List<CardResponse> cards,
      String? message,
      List<ArcheivedCard>? archievedCards,
      List<BlockedCards>? deletedCards,
      CardResponse? defaultCard,
      Card? anotherCard,
      SuccessResponseModel? successResponseModel}) = _Initial;

  factory CardState.initial() => const CardState(
      businessUser: true,
      archiveCardLoading: false,
      deleteCardLoading: false,
      cards: [],
      isLoading: false,
      hasError: false,
      pageLoading: false);
}
