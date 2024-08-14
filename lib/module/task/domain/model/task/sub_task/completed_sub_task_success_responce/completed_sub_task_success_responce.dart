import 'package:json_annotation/json_annotation.dart';

import 'sub_task.dart';

part 'completed_sub_task_success_responce.g.dart';

@JsonSerializable()
class CompletedSubTaskSuccessResponce {
  String? message;
  @JsonKey(name: 'sub_task')
  List<CompletedSubTasks>? subTask;

  CompletedSubTaskSuccessResponce({this.message, this.subTask});

  factory CompletedSubTaskSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$CompletedSubTaskSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompletedSubTaskSuccessResponceToJson(this);
  }
}
