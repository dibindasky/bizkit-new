part of 'card_bloc.dart';

@freezed
class CardEvent with _$CardEvent {
  const factory CardEvent.getCards() = GetCards;
  const factory CardEvent.getCardsnextPage() = GetCardsnextPage;
}