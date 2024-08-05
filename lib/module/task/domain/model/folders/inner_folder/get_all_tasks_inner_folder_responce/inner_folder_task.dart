import 'package:bizkit/module/task/domain/model/folders/inner_folder/get_all_tasks_inner_folder_responce/created_by.dart';
import 'package:json_annotation/json_annotation.dart';

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
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  @JsonKey(name: 'created_at')
  String? createdAt;
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
    this.isOwned,
    this.spotlightOn,
    this.createdBy,
    this.createdAt,
  });

  factory InnerFolderTask.fromJson(Map<String, dynamic> json) {
    return _$InnerFolderTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InnerFolderTaskToJson(this);
}
