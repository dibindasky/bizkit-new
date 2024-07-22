import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class SubTasks {
  String? title;
  String? description;

  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  SubTasks({
    this.title,
    this.description,
    this.isCompleted,
  });

  factory SubTasks.fromJson(Map<String, dynamic> json) {
    return _$SubTasksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTasksToJson(this);
}
