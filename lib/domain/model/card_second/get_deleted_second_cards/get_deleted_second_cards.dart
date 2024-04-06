import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_deleted_second_cards.g.dart';

@JsonSerializable()
class GetDeletedSecondCards {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<SecondCard>? secondCards;

  GetDeletedSecondCards({
    this.count,
    this.next,
    this.previous,
    this.secondCards,
  });

  factory GetDeletedSecondCards.fromJson(Map<String, dynamic> json) {
    return _$GetDeletedSecondCardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDeletedSecondCardsToJson(this);
}
