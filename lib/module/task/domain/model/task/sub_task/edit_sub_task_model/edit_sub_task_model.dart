import 'package:json_annotation/json_annotation.dart';

part 'edit_sub_task_model.g.dart';

@JsonSerializable()
class EditSubTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'sub_task_id')
  String? subTaskId;
  String? title;
  String? description;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;

  EditSubTaskModel({
    this.taskId,
    this.subTaskId,
    this.title,
    this.description,
    this.deadLine,
    this.isCompleted,
    this.totalTimeTaken,
  });

  factory EditSubTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditSubTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditSubTaskModelToJson(this);
}
