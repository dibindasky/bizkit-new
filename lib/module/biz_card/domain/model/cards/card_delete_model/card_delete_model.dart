import 'package:json_annotation/json_annotation.dart';

part 'card_delete_model.g.dart';

@JsonSerializable()
class CardDeleteModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;

  CardDeleteModel({this.bizcardId, this.isDisabled});

  factory CardDeleteModel.fromJson(Map<String, dynamic> json) {
    return _$CardDeleteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardDeleteModelToJson(this);
}
