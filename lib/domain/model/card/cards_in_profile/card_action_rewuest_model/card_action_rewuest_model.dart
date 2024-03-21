import 'package:json_annotation/json_annotation.dart';

part 'card_action_rewuest_model.g.dart';

@JsonSerializable()
class CardActionRewuestModel {
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_active')
  bool? isActive;

  CardActionRewuestModel({this.isArchived, this.isActive});

  factory CardActionRewuestModel.fromJson(Map<String, dynamic> json) {
    return _$CardActionRewuestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardActionRewuestModelToJson(this);
}
