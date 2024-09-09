import 'package:json_annotation/json_annotation.dart';

part 'send_connection_responce.g.dart';

@JsonSerializable()
class SendConnectionResponce {
  String? message;
  @JsonKey(name: 'connection_request_id')
  String? connectionRequestId;

  SendConnectionResponce({this.message, this.connectionRequestId});

  factory SendConnectionResponce.fromJson(Map<String, dynamic> json) {
    return _$SendConnectionResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendConnectionResponceToJson(this);
}
