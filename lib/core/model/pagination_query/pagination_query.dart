import 'package:json_annotation/json_annotation.dart';

part 'pagination_query.g.dart';

@JsonSerializable()
class PaginationQuery {
  @JsonKey(name: 'completed_tasks')
  bool? completedTasks;
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  PaginationQuery({this.page, this.pageSize, this.completedTasks});

  factory PaginationQuery.fromJson(Map<String, dynamic> json) {
    return _$PaginationQueryFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$PaginationQueryToJson(this);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'page': page,
      'pageSize': pageSize,
    };
    if (completedTasks != null) {
      data['completed_tasks'] = completedTasks;
    }
    return data;
  }
}
