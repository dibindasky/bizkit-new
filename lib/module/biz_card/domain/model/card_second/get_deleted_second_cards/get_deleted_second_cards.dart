import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_deleted_second_cards.g.dart';

@JsonSerializable()
class GetDeletedSecondCards {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<SecondCardNew>? secondCards;

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
