part of 'card_bloc.dart';

@freezed
class CardEvent with _$CardEvent {
  const factory CardEvent.getCards() = GetCards;
  const factory CardEvent.getCardsnextPage() = GetCardsnextPage;
  const factory CardEvent.getCardyUserId({required int id}) = GetCardyUserId;
  const factory CardEvent.getCardyCardId({required int id}) = GetCardyCardId;
  const factory CardEvent.setDefault({required int id}) = SetDefault;
  const factory CardEvent.deleteCard({required int id}) = DeleteCard;
  const factory CardEvent.archiveCard({required int id}) = ArchiveCard;
}
