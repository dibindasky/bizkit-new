import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'recent_tasks.g.dart';

@JsonSerializable()
class RecentTasks {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'task_title')
  String? taskTitle;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  String? status;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;

  RecentTasks({
    this.taskId,
    this.taskTitle,
    this.createdAt,
    this.deadLine,
    this.isOwned,
    this.status,
    this.createdBy,
  });

  factory RecentTasks.fromJson(Map<String, dynamic> json) {
    return _$RecentTasksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecentTasksToJson(this);
}
