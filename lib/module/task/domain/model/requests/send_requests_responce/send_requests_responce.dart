import 'package:json_annotation/json_annotation.dart';

import 'sent_request.dart';

part 'send_requests_responce.g.dart';

@JsonSerializable()
class SendRequestsResponce {
  @JsonKey(name: 'sent_requests')
  List<SentRequest>? sentRequests;

  SendRequestsResponce({this.sentRequests});

  factory SendRequestsResponce.fromJson(Map<String, dynamic> json) {
    return _$SendRequestsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendRequestsResponceToJson(this);
}
