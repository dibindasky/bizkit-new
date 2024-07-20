import 'package:json_annotation/json_annotation.dart';

part 'task_counts_responce.g.dart';

@JsonSerializable()
class TaskCountsResponce {
  @JsonKey(name: 'task_counts')
  Map<String, int> taskCounts;

  TaskCountsResponce({required this.taskCounts});

  factory TaskCountsResponce.fromJson(Map<String, dynamic> json) =>
      _$TaskCountsResponceFromJson(json);

  Map<String, dynamic> toJson() => _$TaskCountsResponceToJson(this);
}
