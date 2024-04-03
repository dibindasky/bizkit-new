import 'package:json_annotation/json_annotation.dart';

import '../card/card.dart';

part 'get_card_response_model.g.dart';

@JsonSerializable()
class GetCardResponseModel {
  int? count;
  String? next;
  String? previous;
  List<Card>? results;

  GetCardResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetCardResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCardResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCardResponseModelToJson(this);
}
