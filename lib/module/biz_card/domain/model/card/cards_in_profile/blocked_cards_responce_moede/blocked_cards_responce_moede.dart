import 'package:json_annotation/json_annotation.dart';

import 'deleted_cards.dart';

part 'blocked_cards_responce_moede.g.dart';

@JsonSerializable()
class BlockedCardsResponceMoede {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<DeletedCard>? deletedCards;

  BlockedCardsResponceMoede({
    this.count,
    this.next,
    this.previous,
    this.deletedCards,
  });

  factory BlockedCardsResponceMoede.fromJson(Map<String, dynamic> json) {
    return _$BlockedCardsResponceMoedeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockedCardsResponceMoedeToJson(this);
}
