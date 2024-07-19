import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'sub_task.dart';

part 'task.g.dart';

@JsonSerializable()
class InsideAFolderTasks {
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

  InsideAFolderTasks({
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

  factory InsideAFolderTasks.fromJson(Map<String, dynamic> json) =>
      _$InsideAFolderTasksFromJson(json);

  Map<String, dynamic> toJson() => _$InsideAFolderTasksToJson(this);
}
