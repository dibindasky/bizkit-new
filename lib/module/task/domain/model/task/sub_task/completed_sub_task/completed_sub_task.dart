import 'package:json_annotation/json_annotation.dart';

part 'completed_sub_task.g.dart';

@JsonSerializable()
class CompletedSubTask {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'sub_task_id')
  String? subTaskId;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;

  CompletedSubTask({
    this.taskId,
    this.subTaskId,
    this.isCompleted,
    this.totalTimeTaken,
  });

  factory CompletedSubTask.fromJson(Map<String, dynamic> json) {
    return _$CompletedSubTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompletedSubTaskToJson(this);
}
