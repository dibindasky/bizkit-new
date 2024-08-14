import 'package:bizkit/module/task/domain/model/task/get_task_responce/created_user_details.dart';
import 'package:json_annotation/json_annotation.dart';

import 'assigned_to_detail.dart';
import 'attachment.dart';
import 'sub_task.dart';

part 'get_task_responce.g.dart';

@JsonSerializable()
class GetTaskResponce {
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
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_killed')
  bool? isKilled;
  List<String>? tags;
  List<Attachment>? attachments;
  @JsonKey(name: 'sub_task')
  List<SubTask>? subTask;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  String? status;
  @JsonKey(name: 'created_user_details')
  CreatedUserDetails? createdUserDetails;
  @JsonKey(name: 'assigned_to_details')
  List<AssignedToDetail>? assignedToDetails;

  GetTaskResponce({
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
    this.createdAt,
    this.status,
    this.isOwned,
    this.assignedToDetails,
  });

  factory GetTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$GetTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTaskResponceToJson(this);
}
