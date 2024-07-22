import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'received_requests_responce.g.dart';

@JsonSerializable()
class ReceivedRequestsResponce {
  List<ReceivedTask>? tasks;

  ReceivedRequestsResponce({this.tasks});

  factory ReceivedRequestsResponce.fromJson(Map<String, dynamic> json) {
    return _$ReceivedRequestsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceivedRequestsResponceToJson(this);
}
