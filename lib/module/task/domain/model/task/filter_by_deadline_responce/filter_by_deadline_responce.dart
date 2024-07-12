import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'filter_by_deadline_responce.g.dart';

@JsonSerializable()
class FilterByDeadlineResponce {
  List<DTasks>? tasks;

  FilterByDeadlineResponce({this.tasks});

  factory FilterByDeadlineResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByDeadlineResponceToJson(this);
}
