import 'package:json_annotation/json_annotation.dart';

part 'connection_request_id_model.g.dart';

@JsonSerializable()
class ConnectionRequestIdModel {
  @JsonKey(name: 'connection_request_id')
  int? connectionRequestId;

  ConnectionRequestIdModel({this.connectionRequestId});

  factory ConnectionRequestIdModel.fromJson(Map<String, dynamic> json) {
    return _$ConnectionRequestIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConnectionRequestIdModelToJson(this);
}
