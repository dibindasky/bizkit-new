import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_search_responce.g.dart';

@JsonSerializable()
class TaskSearchResponce {
  List<Task>? tasks;

  TaskSearchResponce({this.tasks});

  factory TaskSearchResponce.fromJson(Map<String, dynamic> json) {
    return _$TaskSearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskSearchResponceToJson(this);
}
