import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class SubTasks {
  String? title;
  String? description;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;

  SubTasks({
    this.title,
    this.description,
    this.deadLine,
    this.isCompleted,
    this.totalTimeTaken,
  });

  factory SubTasks.fromJson(Map<String, dynamic> json) {
    return _$SubTasksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTasksToJson(this);
}
