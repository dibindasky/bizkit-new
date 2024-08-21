import 'package:json_annotation/json_annotation.dart';

import 'bizcard.dart';

part 'get_all_cards.g.dart';

@JsonSerializable()
class GetAllCards {
  List<Bizcard>? bizcards;

  GetAllCards({this.bizcards});

  factory GetAllCards.fromJson(Map<String, dynamic> json) {
    return _$GetAllCardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllCardsToJson(this);
}
