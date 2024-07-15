import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';

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
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_killed')
  bool? isKilled;
  List<dynamic>? tags;
  List<dynamic>? attachments;
  @JsonKey(name: 'sub_task')
  List<dynamic>? subTask;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

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
    this.assignedTo,
    this.createdAt,
  });

  factory GetTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$GetTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTaskResponceToJson(this);
}
