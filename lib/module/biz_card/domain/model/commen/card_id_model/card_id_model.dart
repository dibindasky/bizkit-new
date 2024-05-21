import 'package:json_annotation/json_annotation.dart';

part 'card_id_model.g.dart';

@JsonSerializable()
class CardIdModel {
  @JsonKey(name: 'card_id')
  int? cardId;

  CardIdModel({this.cardId});

  factory CardIdModel.fromJson(Map<String, dynamic> json) {
    return _$CardIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardIdModelToJson(this);
}
