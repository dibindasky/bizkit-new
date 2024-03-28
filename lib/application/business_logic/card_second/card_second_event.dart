part of 'card_second_bloc.dart';

@freezed
class CardSecondEvent with _$CardSecondEvent {
  const factory CardSecondEvent.started() = _Started;
  const factory CardSecondEvent.getAllCardsSecond() = GetAllCardsSecond;
  const factory CardSecondEvent.updateCardSecond() = UpdateCardSecond;
  const factory CardSecondEvent.getCardSecondEvent() = GetCardSecondEvent;
}
