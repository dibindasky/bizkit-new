import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class CompletedSubTasks {
  String? title;
  String? description;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;
  String? duration;

  CompletedSubTasks({
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.id,
    this.totalTimeTaken,
    this.duration,
  });

  factory CompletedSubTasks.fromJson(Map<String, dynamic> json) {
    return _$SubTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTaskToJson(this);
}
