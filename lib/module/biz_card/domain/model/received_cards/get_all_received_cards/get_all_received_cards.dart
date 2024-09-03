import 'package:json_annotation/json_annotation.dart';
import 'received_card.dart';

part 'get_all_received_cards.g.dart';

@JsonSerializable()
class GetAllReceivedCards {
  @JsonKey(name: 'visiting_cards')
  List<ReceivedCard>? receivedCards;

  GetAllReceivedCards({this.receivedCards});

  factory GetAllReceivedCards.fromJson(Map<String, dynamic> json) {
    return _$GetAllReceivedCardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllReceivedCardsToJson(this);

  // Adding the copyWith method
  GetAllReceivedCards copyWith({
    List<ReceivedCard>? receivedCards,
  }) {
    return GetAllReceivedCards(
      receivedCards: receivedCards ?? this.receivedCards,
    );
  }
}
