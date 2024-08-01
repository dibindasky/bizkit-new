import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class ReportTask {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'task_title')
  String? taskTitle;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  String? status;

  ReportTask({
    this.taskId,
    this.taskTitle,
    this.createdBy,
    this.deadLine,
    this.status,
  });

  factory ReportTask.fromJson(Map<String, dynamic> json) =>
      _$ReportTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTaskToJson(this);
}
