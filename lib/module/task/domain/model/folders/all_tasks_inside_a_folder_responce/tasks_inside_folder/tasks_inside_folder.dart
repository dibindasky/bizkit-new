import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'sub_task.dart';

part 'tasks_inside_folder.g.dart';

@JsonSerializable()
class TasksInsideFolder {
  @JsonKey(name: 'task_id')
  String? taskId;
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

  TasksInsideFolder({
    this.taskId,
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
  });

  factory TasksInsideFolder.fromJson(Map<String, dynamic> json) {
    return _$TasksInsideFolderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TasksInsideFolderToJson(this);
}
