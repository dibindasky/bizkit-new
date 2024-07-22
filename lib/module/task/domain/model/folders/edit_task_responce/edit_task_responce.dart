import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../task/task_model/attachment.dart';
import '../../task/task_model/sub_task.dart';

part 'edit_task_responce.g.dart';

@JsonSerializable()
class EditTaskModel {
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
  List<TaskAssignedTo>? assignedTo;

  @JsonKey(name: 'task_id')
  String? taskId;

  EditTaskModel({
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
    this.taskId,
  });

  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
}
