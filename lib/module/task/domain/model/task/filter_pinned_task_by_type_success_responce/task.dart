import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_success_responce/pinned_tasks_by_type/pinned_tasks_by_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class PinnedTasksByTypes {
  @JsonKey(name: '_id')
  String? id;
  PinnedTasksByType? task;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  PinnedTasksByTypes({
    this.id,
    this.task,
    this.taskType,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
  });

  factory PinnedTasksByTypes.fromJson(Map<String, dynamic> json) =>
      _$PinnedTasksByTypesFromJson(json);

  Map<String, dynamic> toJson() => _$PinnedTasksByTypesToJson(this);
}
