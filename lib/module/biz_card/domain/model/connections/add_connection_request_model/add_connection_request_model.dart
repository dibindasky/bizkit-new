import 'package:json_annotation/json_annotation.dart';

part 'add_connection_request_model.g.dart';

@JsonSerializable()
class AddConnectionRequestModel {
  @JsonKey(name: 'card_user_id')
  int? cardUserId;

  AddConnectionRequestModel({this.cardUserId});

  factory AddConnectionRequestModel.fromJson(Map<String, dynamic> json) {
    return _$AddConnectionRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddConnectionRequestModelToJson(this);
}
