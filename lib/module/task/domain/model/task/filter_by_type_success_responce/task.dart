import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  @JsonKey(name: '_id')
  String? id;
  Task? task;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  Task({
    this.id,
    this.task,
    this.taskType,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
