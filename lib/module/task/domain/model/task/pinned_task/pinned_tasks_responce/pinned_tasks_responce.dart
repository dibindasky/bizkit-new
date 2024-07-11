import 'package:json_annotation/json_annotation.dart';

import 'pinned_task.dart';

part 'pinned_tasks_responce.g.dart';

@JsonSerializable()
class PinnedTasksResponce {
  @JsonKey(name: 'pinned_tasks')
  List<PinnedTask>? pinnedTasks;

  PinnedTasksResponce({this.pinnedTasks});

  factory PinnedTasksResponce.fromJson(Map<String, dynamic> json) {
    return _$PinnedTasksResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PinnedTasksResponceToJson(this);
}
