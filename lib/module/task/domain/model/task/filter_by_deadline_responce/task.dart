import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_responce/deadline_tasks/deadline_tasks.dart';
import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'task.g.dart';

@JsonSerializable()
class DTasks {
  @JsonKey(name: '_id')
  String? id;
  DeadlineTasks? task;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  DTasks({
    this.id,
    this.task,
    this.taskType,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
  });

  factory DTasks.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
