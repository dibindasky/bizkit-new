import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class SubTask {
  // Local ID
  int? localId;

  String? title;
  String? description;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: '_id')
  String? id;

  SubTask({
    this.title,
    this.description,
    this.deadLine,
    this.isCompleted,
    this.totalTimeTaken,
    this.duration,
    this.id,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return _$SubTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTaskToJson(this);

  SubTask copyWith({
    String? title,
    String? description,
    String? deadLine,
    bool? isCompleted,
    String? totalTimeTaken,
    String? duration,
    String? id,
  }) {
    return SubTask(
      title: title ?? this.title,
      description: description ?? this.description,
      deadLine: deadLine ?? this.deadLine,
      isCompleted: isCompleted ?? this.isCompleted,
      totalTimeTaken: totalTimeTaken ?? this.totalTimeTaken,
      duration: duration ?? this.duration,
      id: id ?? this.id,
    );
  }

  static const colTaskSubtaskLocalId = 'task_subtask_local_id';

  static const colTaskSubtaskId = 'task_subtask_id';
  static const colTaskSubtaskTitle = 'task_subtask_title';
  static const colTaskSubtaskDescription = 'task_subtask_description';
  static const colTaskSubtaskDeadline = 'task_subtask_deadline';
  static const colTaskSubtaskIsCompleted = 'task_subtask_is_completed';
  static const colTaskSubtaskTotalTimeTaken = 'task_subtask_total_time_taken';
  static const colTaskSubtaskDuration = 'task_subtask_duration';

  static const colTaskSubTaskReferenceId = 'task_subtask_reference_id';
}
