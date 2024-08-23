import 'package:json_annotation/json_annotation.dart';

part 'card_detail_model.g.dart';

@JsonSerializable()
class CardDetailModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;

  CardDetailModel({this.bizcardId});

  factory CardDetailModel.fromJson(Map<String, dynamic> json) {
    return _$CardDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardDetailModelToJson(this);
}
