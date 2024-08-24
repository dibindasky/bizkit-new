import 'package:json_annotation/json_annotation.dart';

part 'visiting_card_delete_model.g.dart';

@JsonSerializable()
class VisitingCardDeleteModel {
  @JsonKey(name: 'card_id')
  String? cardId;
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;

  VisitingCardDeleteModel({this.cardId, this.isDisabled});

  factory VisitingCardDeleteModel.fromJson(Map<String, dynamic> json) {
    return _$VisitingCardDeleteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VisitingCardDeleteModelToJson(this);
}
