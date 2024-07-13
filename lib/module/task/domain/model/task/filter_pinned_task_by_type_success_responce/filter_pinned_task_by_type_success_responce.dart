import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'filter_pinned_task_by_type_success_responce.g.dart';

@JsonSerializable()
class FilterPinnedTaskByTypeSuccessResponce {
  List<PinnedTasksByTypes>? tasks;

  FilterPinnedTaskByTypeSuccessResponce({this.tasks});

  factory FilterPinnedTaskByTypeSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$FilterPinnedTaskByTypeSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilterPinnedTaskByTypeSuccessResponceToJson(this);
  }
}
