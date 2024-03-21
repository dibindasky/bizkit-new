import 'package:json_annotation/json_annotation.dart';

import 'blocked cards.dart';

part 'blocked_cards_responce_moede.g.dart';

@JsonSerializable()
class BlockedCardsResponceMoede {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<BlockedCards>? blockedCards;

  BlockedCardsResponceMoede({
    this.count,
    this.next,
    this.previous,
    this.blockedCards,
  });

  factory BlockedCardsResponceMoede.fromJson(Map<String, dynamic> json) {
    return _$BlockedCardsResponceMoedeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockedCardsResponceMoedeToJson(this);
}
