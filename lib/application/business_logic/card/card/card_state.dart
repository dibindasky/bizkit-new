part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    required bool isLoading,
    required bool cardLoading,
    required bool pageLoading,
    required bool hasError,
    required bool businessUser,
    required bool isArcheveCard,
    required bool archiveCardLoading,
    required bool archiveCardRestored,
    required bool deleteCardLoading,
    required bool deleteCardEventLoading,
    required bool deleteCardRestored,
    required bool viewsLoading,
    required bool companyDataRequestLoading,
    required bool companyDataRequestSuccess,
    required List<CardResponse> cards,
    String? message,
    List<ArcheivedCard>? archievedCards,
    List<DeletedCard>? deletedCards,
    List<UserView>? cardViewList,
    CardResponse? defaultCard,
    Card? anotherCard,
  }) = _Initial;

  factory CardState.initial() => const CardState(
        businessUser: true,
        isArcheveCard: false,
        deleteCardLoading: false,
        archiveCardRestored: false,
        deleteCardRestored: false,
        viewsLoading: false,
        archiveCardLoading: false,
        deleteCardEventLoading: false,
        cardLoading: false,
        cards: [],
        isLoading: true,
        hasError: false,
        pageLoading: false,
        companyDataRequestLoading: false,
        companyDataRequestSuccess: false,
      );
}
