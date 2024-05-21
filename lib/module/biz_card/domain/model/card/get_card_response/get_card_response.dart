import 'package:json_annotation/json_annotation.dart';

import 'card_response.dart';

part 'get_card_response.g.dart';

@JsonSerializable()
class GetCardResponse {
  int? count;
  String? next;
  String? previous;
  List<CardResponse>? results;

  GetCardResponse({this.count, this.next, this.previous, this.results});

  factory GetCardResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCardResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCardResponseToJson(this);
}
