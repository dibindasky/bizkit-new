import 'package:json_annotation/json_annotation.dart';
import 'visiting_card.dart';

part 'get_all_visiting_cards.g.dart';

@JsonSerializable()
class GetAllVisitingCards {
  @JsonKey(name: 'visiting_cards')
  List<VisitingCard>? visitingCards;

  GetAllVisitingCards({this.visitingCards});

  factory GetAllVisitingCards.fromJson(Map<String, dynamic> json) {
    return _$GetAllVisitingCardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllVisitingCardsToJson(this);

  // Adding the copyWith method
  GetAllVisitingCards copyWith({
    List<VisitingCard>? visitingCards,
  }) {
    return GetAllVisitingCards(
      visitingCards: visitingCards ?? this.visitingCards,
    );
  }
}
