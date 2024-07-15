import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'task_search_responce.g.dart';

@JsonSerializable()
class TaskSearchResponce {
  List<SearchTasks>? tasks;

  TaskSearchResponce({this.tasks});

  factory TaskSearchResponce.fromJson(Map<String, dynamic> json) {
    return _$TaskSearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskSearchResponceToJson(this);
}
