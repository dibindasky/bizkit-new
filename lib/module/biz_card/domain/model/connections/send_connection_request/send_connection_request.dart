import 'package:json_annotation/json_annotation.dart';

part 'send_connection_request.g.dart';

@JsonSerializable()
class SendConnectionRequest {
  @JsonKey(name: 'to_user')
  String? toUser;

  SendConnectionRequest({this.toUser});

  factory SendConnectionRequest.fromJson(Map<String, dynamic> json) {
    return _$SendConnectionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendConnectionRequestToJson(this);
}
