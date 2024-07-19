import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'sub_task.dart';

part 'inner_folder_task.g.dart';

@JsonSerializable()
class InnerFolderTask {
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

  InnerFolderTask({
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

  factory InnerFolderTask.fromJson(Map<String, dynamic> json) {
    return _$InnerFolderTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InnerFolderTaskToJson(this);
}
