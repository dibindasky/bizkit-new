import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
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
  @JsonKey(name: 'next_action_date')
  List<NextActionDate>? nextActionDate;
  bool? isNextActionDate;

  EditTaskModel(
      {this.title,
      this.description,
      this.tags,
      this.taskId,
      this.assignedTo,
      this.deadLine,
      this.isNextActionDate = false,
      this.nextActionDate});

  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditTaskModelFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = isNextActionDate == true
        ? {
            'task_id': taskId,
            'next_action_date': nextActionDate?.map((e) => e.toJson()).toList(),
          }
        : {
            'task_id': taskId,
            'title': title,
            'description': description,
            'tags': tags,
            'dead_line': deadLine,
            'assigned_to': assignedTo,
          };

    return data;
  }
}
