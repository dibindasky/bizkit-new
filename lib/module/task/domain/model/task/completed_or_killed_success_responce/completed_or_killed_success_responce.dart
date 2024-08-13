import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'completed_or_killed_success_responce.g.dart';

@JsonSerializable()
class CompletedOrKilledSuccessResponce {
  List<TasksCompletedOrKilled>? tasks;

  CompletedOrKilledSuccessResponce({this.tasks});

  factory CompletedOrKilledSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$CompletedOrKilledSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompletedOrKilledSuccessResponceToJson(this);
  }
}
