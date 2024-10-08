import 'package:json_annotation/json_annotation.dart';

part 'filter_pinned_task_by_type_model.g.dart';

@JsonSerializable()
class FilterPinnedTaskByTypeModel {
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  FilterPinnedTaskByTypeModel(
      {this.taskType, this.isPinned, this.page, this.pageSize});

  factory FilterPinnedTaskByTypeModel.fromJson(Map<String, dynamic> json) {
    return _$FilterPinnedTaskByTypeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterPinnedTaskByTypeModelToJson(this);
}
