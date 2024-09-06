import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'send_connection_requets_responce.g.dart';

@JsonSerializable()
class SendConnectionRequetsResponce {
  List<SendConnectionRequet>? requests;

  SendConnectionRequetsResponce({this.requests});

  factory SendConnectionRequetsResponce.fromJson(Map<String, dynamic> json) {
    return _$SendConnectionRequetsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendConnectionRequetsResponceToJson(this);
}
