import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/created_by.dart';
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
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  InsideAFolderTasks(
      {this.taskId,
      this.title,
      this.description,
      this.priorityLevel,
      this.recurrentTask,
      this.isCompleted,
      this.deadLine,
      this.isKilled,
      this.tags,
      this.isOwned,
      this.spotlightOn,
      this.createdBy,
      this.createdAt});

  factory InsideAFolderTasks.fromJson(Map<String, dynamic> json) =>
      _$InsideAFolderTasksFromJson(json);

  Map<String, dynamic> toJson() => _$InsideAFolderTasksToJson(this);
}
