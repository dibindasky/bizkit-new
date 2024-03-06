import 'package:json_annotation/json_annotation.dart';

part 'create_connection_with_card_id_model.g.dart';

@JsonSerializable()
class CreateConnectionWithCardIdModel {
  @JsonKey(name: 'card_id')
  int? cardId;

  CreateConnectionWithCardIdModel({this.cardId});

  factory CreateConnectionWithCardIdModel.fromJson(Map<String, dynamic> json) {
    return _$CreateConnectionWithCardIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateConnectionWithCardIdModelToJson(this);
  }
}
