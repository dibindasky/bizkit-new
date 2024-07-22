import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'task.g.dart';

@JsonSerializable()
class ReceivedTask {
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
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;

  ReceivedTask({
    this.taskId,
    this.taskTitle,
    this.description,
    this.subtasks,
    this.priorityLevel,
    this.createdAt,
    this.deadLine,
    this.createdBy,
  });

  factory ReceivedTask.fromJson(Map<String, dynamic> json) =>
      _$ReceivedTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ReceivedTaskToJson(this);
}
