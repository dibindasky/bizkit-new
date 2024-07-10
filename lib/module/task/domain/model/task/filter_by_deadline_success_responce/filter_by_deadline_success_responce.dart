import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'filter_by_deadline_success_responce.g.dart';

@JsonSerializable()
class FilterByDeadlineSuccessResponce {
  List<Task>? tasks;

  FilterByDeadlineSuccessResponce({this.tasks});

  factory FilterByDeadlineSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilterByDeadlineSuccessResponceToJson(this);
  }
}
