import 'package:json_annotation/json_annotation.dart';

part 'create_visiting_card_responce.g.dart';

@JsonSerializable()
class CreateVisitingCardResponce {
  String? message;
  @JsonKey(name: 'visiting_card_id')
  String? visitingCardId;

  CreateVisitingCardResponce({this.message, this.visitingCardId});

  factory CreateVisitingCardResponce.fromJson(Map<String, dynamic> json) {
    return _$CreateVisitingCardResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateVisitingCardResponceToJson(this);
}
