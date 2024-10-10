import 'package:json_annotation/json_annotation.dart';

import 'quick_tasks.dart';

part 'quick_tasks_responce.g.dart';

@JsonSerializable()
class QuickTasksResponce {
  List<QuickTasks>? data;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  QuickTasksResponce({
    this.data,
    this.pageSize,
    this.currentPage,
    this.hasMore,
  });

  factory QuickTasksResponce.fromJson(Map<String, dynamic> json) {
    return _$QuickTasksResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuickTasksResponceToJson(this);
}
