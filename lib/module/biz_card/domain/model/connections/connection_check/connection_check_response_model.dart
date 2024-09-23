import 'package:json_annotation/json_annotation.dart';

part 'connection_check_response_model.g.dart';

@JsonSerializable()
class ConnectionCheckResponseModel {
  @JsonKey(name: 'connection_id')
  final String? connectionId;
  @JsonKey(name: 'to_user')
  final String? toUser;
  @JsonKey(name: 'to_card')
  final String? toCard;
  final String? status;

  ConnectionCheckResponseModel({
    this.connectionId,
    this.toUser,
    this.toCard,
    this.status,
  });

  factory ConnectionCheckResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionCheckResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionCheckResponseModelToJson(this);
}
