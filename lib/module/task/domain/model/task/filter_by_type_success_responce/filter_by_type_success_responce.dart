import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'filter_by_type_success_responce.g.dart';

@JsonSerializable()
class FilterByTypeSuccessResponce {
  List<Task>? tasks;

  FilterByTypeSuccessResponce({this.tasks});

  factory FilterByTypeSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterByTypeSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByTypeSuccessResponceToJson(this);
}
