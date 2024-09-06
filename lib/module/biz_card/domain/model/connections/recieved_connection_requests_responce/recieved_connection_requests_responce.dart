import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'recieved_connection_requests_responce.g.dart';

@JsonSerializable()
class RecievedConnectionRequestsResponce {
  List<RecievedConnectionRequest>? requests;

  RecievedConnectionRequestsResponce({this.requests});

  factory RecievedConnectionRequestsResponce.fromJson(
      Map<String, dynamic> json) {
    return _$RecievedConnectionRequestsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecievedConnectionRequestsResponceToJson(this);
  }
}
