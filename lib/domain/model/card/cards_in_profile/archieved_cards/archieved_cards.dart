import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'archieved_cards.g.dart';

@JsonSerializable()
class ArchievedCards {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  ArchievedCards({this.count, this.next, this.previous, this.results});

  factory ArchievedCards.fromJson(Map<String, dynamic> json) {
    return _$ArchievedCardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArchievedCardsToJson(this);
}
