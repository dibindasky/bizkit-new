import 'package:json_annotation/json_annotation.dart';

part 'filter_pinned_task_by_type_model.g.dart';

@JsonSerializable()
class FilterPinnedTaskByTypeModel {
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  FilterPinnedTaskByTypeModel({this.taskType, this.isPinned});

  factory FilterPinnedTaskByTypeModel.fromJson(Map<String, dynamic> json) {
    return _$FilterPinnedTaskByTypeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterPinnedTaskByTypeModelToJson(this);
}
