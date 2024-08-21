import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class SubTask {
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
}
