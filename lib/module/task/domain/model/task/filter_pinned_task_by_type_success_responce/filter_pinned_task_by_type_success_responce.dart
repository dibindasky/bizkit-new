import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_pinned_task_by_type_success_responce.g.dart';

@JsonSerializable()
class FilterPinnedTaskByTypeSuccessResponce {
  @JsonKey(name: 'data')
  List<Task>? data;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  FilterPinnedTaskByTypeSuccessResponce(
      {this.data, this.currentPage, this.hasMore, this.pageSize});

  factory FilterPinnedTaskByTypeSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$FilterPinnedTaskByTypeSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilterPinnedTaskByTypeSuccessResponceToJson(this);
  }
}
