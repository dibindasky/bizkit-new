import 'package:json_annotation/json_annotation.dart';

part 'tasks_count_model.g.dart';

@JsonSerializable()
class TasksCountModel {
  @JsonKey(name: 'from_date')
  String? fromDate;

  TasksCountModel({this.fromDate});

  factory TasksCountModel.fromJson(Map<String, dynamic> json) {
    return _$TasksCountModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TasksCountModelToJson(this);
}
