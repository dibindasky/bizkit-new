import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/sub_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  @JsonKey(name: 'task_id')
  String? id;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'task_title')
  String? title;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;
  @JsonKey(name: 'subtasks')
  List<SubTask>? subtasks;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  Task({
    this.id,
    this.taskType,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
    this.createdAt,
    this.deadLine,
    this.description,
    this.priorityLevel,
    this.subtasks,
    this.title,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
