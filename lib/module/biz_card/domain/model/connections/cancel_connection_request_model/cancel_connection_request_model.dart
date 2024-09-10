import 'package:json_annotation/json_annotation.dart';

part 'cancel_connection_request_model.g.dart';

@JsonSerializable()
class CancelConnectionRequestModel {
  @JsonKey(name: 'connection_id')
  String? connectionId;

  CancelConnectionRequestModel({this.connectionId});

  factory CancelConnectionRequestModel.fromJson(Map<String, dynamic> json) {
    return _$CancelConnectionRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CancelConnectionRequestModelToJson(this);
}
