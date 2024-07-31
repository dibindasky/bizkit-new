import 'package:json_annotation/json_annotation.dart';

part 'completed_task_model.g.dart';

@JsonSerializable()
class CompletedTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  CompletedTaskModel({this.taskId, this.isCompleted});

  factory CompletedTaskModel.fromJson(Map<String, dynamic> json) {
    return _$CompletedTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompletedTaskModelToJson(this);
}
