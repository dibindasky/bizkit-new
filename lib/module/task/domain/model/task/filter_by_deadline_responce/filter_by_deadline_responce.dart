import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_by_deadline_responce.g.dart';

@JsonSerializable()
class FilterByDeadlineResponce {
  @JsonKey(name: 'data')
  List<Task>? data;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  FilterByDeadlineResponce(
      {this.data, this.currentPage, this.hasMore, this.pageSize});

  factory FilterByDeadlineResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByDeadlineResponceToJson(this);
}
