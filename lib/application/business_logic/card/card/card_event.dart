part of 'card_bloc.dart';

@freezed
class CardEvent with _$CardEvent {
  const factory CardEvent.getCards({required bool call}) = GetCards;
  const factory CardEvent.getCardsnextPage() = GetCardsnextPage;
  const factory CardEvent.getCardyUserId({required int id}) = GetCardyUserId;
  const factory CardEvent.getCardyCardId({required int id}) = GetCardyCardId;
  const factory CardEvent.setDefault({required int id}) = SetDefault;
  const factory CardEvent.getdeleteCards({required bool isLoad}) =
      GetdeleteCards;
  const factory CardEvent.getdeleteCardsEvent({required bool isLoad}) =
      GetdeleteCardsEvent;
  const factory CardEvent.cardAction({
    required int id,
    required CardActionRewuestModel cardActionRewuestModel,
  }) = CardAction;
  const factory CardEvent.getArchievedCards({required bool isLoad}) =
      GetArchievedCards;
  const factory CardEvent.getArchievedCardsEvent() = GetArchievedCardsEvent;
  const factory CardEvent.restoreArchiveDeleteCard({
    required int cardId,
    required CardActionRewuestModel cardActionRewuestModel,
  }) = RestoreArchiveDeleteCard;
  const factory CardEvent.clear() = Clear;
}
