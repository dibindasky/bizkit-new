import 'package:bizkit/module/task/domain/model/task/task_search_responce/search_tasks/search_tasks.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class SearchTasks {
  @JsonKey(name: '_id')
  String? id;
  SearchTask? task;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;
  dynamic type;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;

  SearchTasks({
    this.id,
    this.task,
    this.taskType,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
    this.type,
    this.isAccepted,
  });

  factory SearchTasks.fromJson(Map<String, dynamic> json) =>
      _$SearchTasksFromJson(json);

  Map<String, dynamic> toJson() => _$SearchTasksToJson(this);
}
