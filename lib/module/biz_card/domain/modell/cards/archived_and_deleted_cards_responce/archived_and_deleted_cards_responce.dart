import 'package:bizkit/module/biz_card/domain/modell/cards/archived_and_deleted_cards_responce/archived_or_deleted_card/archived_or_deleted_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'archived_and_deleted_cards_responce.g.dart';

@JsonSerializable()
class ArchivedAndDeletedCardsResponce {
  @JsonKey(name: 'archived_cards')
  List<ArchivedOrDeletedCard>? archivedCards;
  @JsonKey(name: 'disabled_cards')
  List<ArchivedOrDeletedCard>? disabledCards;

  ArchivedAndDeletedCardsResponce({this.archivedCards, this.disabledCards});

  factory ArchivedAndDeletedCardsResponce.fromJson(Map<String, dynamic> json) {
    return _$ArchivedAndDeletedCardsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArchivedAndDeletedCardsResponceToJson(this);
  }
}
