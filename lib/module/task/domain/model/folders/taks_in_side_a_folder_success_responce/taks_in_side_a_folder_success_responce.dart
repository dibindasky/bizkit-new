import 'package:json_annotation/json_annotation.dart';
part 'taks_in_side_a_folder_success_responce.g.dart';

@JsonSerializable()
class AllTasksInsideAFolderSuccessResponse {
  final List<FolderModels> data;

  AllTasksInsideAFolderSuccessResponse({required this.data});

  factory AllTasksInsideAFolderSuccessResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AllTasksInsideAFolderSuccessResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AllTasksInsideAFolderSuccessResponseToJson(this);
}

@JsonSerializable()
class FolderModels {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'folder_name')
  final String folderName;
  final List<TaskModels> tasks;

  FolderModels({
    required this.id,
    required this.folderName,
    required this.tasks,
  });

  factory FolderModels.fromJson(Map<String, dynamic> json) =>
      _$FolderModelsFromJson(json);
  Map<String, dynamic> toJson() => _$FolderModelsToJson(this);
}

@JsonSerializable()
class TaskModels {
  @JsonKey(name: 'task_id')
  final String taskId;
  final String title;
  final String description;
  @JsonKey(name: 'priority_level')
  final String priorityLevel;
  @JsonKey(name: 'recurrent_task')
  final bool recurrentTask;
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  @JsonKey(name: 'dead_line')
  final String deadLine;
  @JsonKey(name: 'is_killed')
  final bool isKilled;
  final List<String> tags;
  final List<Attachments> attachments;
  @JsonKey(name: 'sub_task')
  final List<SubTasks> subTask;

  TaskModels({
    required this.taskId,
    required this.title,
    required this.description,
    required this.priorityLevel,
    required this.recurrentTask,
    required this.isCompleted,
    required this.deadLine,
    required this.isKilled,
    required this.tags,
    required this.attachments,
    required this.subTask,
  });

  factory TaskModels.fromJson(Map<String, dynamic> json) =>
      _$TaskModelsFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelsToJson(this);
}

@JsonSerializable()
class Attachments {
  final String attachment;
  final String type;

  Attachments({
    required this.attachment,
    required this.type,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}

@JsonSerializable()
class SubTasks {
  final String title;
  final String description;
  @JsonKey(name: 'dead_line')
  final String deadLine;
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  @JsonKey(name: 'total_time_taken')
  final String totalTimeTaken;
  @JsonKey(name: '_id')
  final String id;

  SubTasks({
    required this.title,
    required this.description,
    required this.deadLine,
    required this.isCompleted,
    required this.totalTimeTaken,
    required this.id,
  });

  factory SubTasks.fromJson(Map<String, dynamic> json) =>
      _$SubTasksFromJson(json);
  Map<String, dynamic> toJson() => _$SubTasksToJson(this);
}
