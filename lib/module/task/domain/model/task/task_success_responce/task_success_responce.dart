import 'package:json_annotation/json_annotation.dart';

part 'task_success_responce.g.dart';

@JsonSerializable()
class TaskSuccessResponce {
  String? message;
  @JsonKey(name: 'task_id')
  String? taskId;

  TaskSuccessResponce({this.message, this.taskId});

  factory TaskSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$TaskSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskSuccessResponceToJson(this);
}
