import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';
import 'attachment.dart';
import 'sub_task.dart';

part 'type_task.g.dart';

@JsonSerializable()
class TypeTask {
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
  List<String>? tags;
  List<Attachment>? attachments;
  @JsonKey(name: 'sub_task')
  List<SubTask>? subTask;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;
  @JsonKey(name: '_id')
  String? id;

  TypeTask({
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
    this.id,
  });

  factory TypeTask.fromJson(Map<String, dynamic> json) {
    return _$TypeTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeTaskToJson(this);
}
