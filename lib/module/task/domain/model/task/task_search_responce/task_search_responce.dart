import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_search_responce.g.dart';

@JsonSerializable()
class TaskSearchResponce {
  @JsonKey(name: 'data')
  List<Task>? data;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;

  TaskSearchResponce(
      {this.data, this.currentPage, this.hasMore, this.pageSize});

  factory TaskSearchResponce.fromJson(Map<String, dynamic> json) {
    return _$TaskSearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskSearchResponceToJson(this);
}
