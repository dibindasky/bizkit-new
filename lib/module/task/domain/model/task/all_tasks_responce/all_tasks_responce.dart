import 'package:json_annotation/json_annotation.dart';

part 'all_tasks_responce.g.dart';

@JsonSerializable()
class Tasks {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'created_by')
  String? createdBy;
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
  List<dynamic>? tags;
  List<dynamic>? attachments;
  @JsonKey(name: 'sub_task')
  List<dynamic>? subTask;
  @JsonKey(name: 'assigned_to')
  List<dynamic>? assignedTo;
  @JsonKey(name: 'is_owned')
  bool? isOwned;

  Tasks({
    this.id,
    this.createdBy,
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
    this.assignedTo,
    this.isOwned,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return _$TasksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}

@JsonSerializable()
class AllTasksResponce {
  List<Tasks> tasks;

  AllTasksResponce({required this.tasks});

  factory AllTasksResponce.fromJson(Map<String, dynamic> json) {
    return _$AllTasksResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllTasksResponceToJson(this);
}
