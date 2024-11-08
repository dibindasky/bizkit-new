import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'task.g.dart';

@JsonSerializable()
class TasksCompletedOrKilled {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'task_title')
  String? taskTitle;
  String? description;
  List<dynamic>? subtasks;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;

  TasksCompletedOrKilled({
    this.taskId,
    this.taskTitle,
    this.description,
    this.subtasks,
    this.priorityLevel,
    this.createdAt,
    this.deadLine,
    this.createdBy,
    this.isOwned,
  });

  factory TasksCompletedOrKilled.fromJson(Map<String, dynamic> json) =>
      _$TasksCompletedOrKilledFromJson(json);

  Map<String, dynamic> toJson() => _$TasksCompletedOrKilledToJson(this);
}
