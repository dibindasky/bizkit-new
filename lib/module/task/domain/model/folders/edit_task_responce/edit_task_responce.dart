import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_task_responce.g.dart';

@JsonSerializable()
class EditTaskModel {
  String? title;
  String? description;
  List<String>? tags;
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'assigned_to')
  List<TaskAssignedTo>? assignedTo;

  EditTaskModel(
      {this.title,
      this.description,
      this.tags,
      this.taskId,
      this.assignedTo,
      this.deadLine});

  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
}
