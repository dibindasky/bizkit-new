import 'package:json_annotation/json_annotation.dart';

import 'assigned_user.dart';

part 'sent_request.g.dart';

@JsonSerializable()
class SentRequest {
  @JsonKey(name: 'task_id')
  String? taskId;
  String? title;
  String? description;
  @JsonKey(name: 'assigned_users')
  List<AssignedUser>? assignedUsers;

  SentRequest({
    this.taskId,
    this.title,
    this.description,
    this.assignedUsers,
  });

  factory SentRequest.fromJson(Map<String, dynamic> json) {
    return _$SentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SentRequestToJson(this);
}
