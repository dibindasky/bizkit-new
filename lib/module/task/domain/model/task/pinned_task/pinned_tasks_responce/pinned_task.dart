import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';
import 'subtask.dart';

part 'pinned_task.g.dart';

@JsonSerializable()
class PinnedTask {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'task_title')
  String? taskTitle;
  String? description;
  List<Subtask>? subtasks;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;

  PinnedTask({
    this.taskId,
    this.taskTitle,
    this.description,
    this.subtasks,
    this.assignedTo,
    this.priorityLevel,
  });

  factory PinnedTask.fromJson(Map<String, dynamic> json) {
    return _$PinnedTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PinnedTaskToJson(this);
}
