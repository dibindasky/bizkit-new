import 'package:json_annotation/json_annotation.dart';

import 'sub_task.dart';

part 'sub_task_add_model.g.dart';

@JsonSerializable()
class SubTaskAddModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'sub_task')
  SubTasks? subTask;

  SubTaskAddModel({this.taskId, this.subTask});

  factory SubTaskAddModel.fromJson(Map<String, dynamic> json) {
    return _$SubTaskAddModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTaskAddModelToJson(this);

  void add(SubTaskAddModel subTasks) {}
}
