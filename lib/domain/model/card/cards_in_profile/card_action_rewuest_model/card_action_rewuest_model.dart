import 'package:json_annotation/json_annotation.dart';

part 'card_action_rewuest_model.g.dart';

@JsonSerializable()
class CardActionRequestModel {
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_active')
  bool? isActive;

  CardActionRequestModel({this.isArchived, this.isActive});

  factory CardActionRequestModel.fromJson(Map<String, dynamic> json) {
    return _$CardActionRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardActionRequestModelToJson(this);
}
