import 'package:json_annotation/json_annotation.dart';

part 'deadline_tasks.g.dart';

@JsonSerializable()
class DeadlineTasks {
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

  DeadlineTasks({
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
  });

  factory DeadlineTasks.fromJson(Map<String, dynamic> json) {
    return _$DeadlineTasksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeadlineTasksToJson(this);
}
