import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_by_deadline_responce.g.dart';

@JsonSerializable()
class FilterByDeadlineResponce {
  List<Task>? tasks;

  FilterByDeadlineResponce({this.tasks});

  factory FilterByDeadlineResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByDeadlineResponceToJson(this);
}
