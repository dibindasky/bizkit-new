import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';
import 'attachment.dart';
import 'sub_task.dart';

part 'received_requests_success_responce.g.dart';

@JsonSerializable()
class ReceivedRequestsSuccessResponce {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'created_by')
  String? createdBy;
  String? title;
  String? description;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;
  @JsonKey(name: 'recurrent_task')
  bool? recurrentTask;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_killed')
  bool? isKilled;
  List<String>? tags;
  List<Attachment>? attachments;
  @JsonKey(name: 'sub_task')
  List<SubTask>? subTask;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;

  ReceivedRequestsSuccessResponce({
    this.id,
    this.createdBy,
    this.title,
    this.description,
    this.priorityLevel,
    this.recurrentTask,
    this.isCompleted,
    this.deadLine,
    this.isKilled,
    this.tags,
    this.attachments,
    this.subTask,
    this.assignedTo,
  });

  factory ReceivedRequestsSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$ReceivedRequestsSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReceivedRequestsSuccessResponceToJson(this);
  }
}
