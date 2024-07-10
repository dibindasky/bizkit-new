import 'package:json_annotation/json_annotation.dart';

part 'task_accepted_or_rejected.g.dart';

@JsonSerializable()
class TaskAcceptedOrRejected {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'acceptance_status')
  String? acceptanceStatus;
  @JsonKey(name: 'task_type')
  String? taskType;

  TaskAcceptedOrRejected({
    this.taskId,
    this.acceptanceStatus,
    this.taskType,
  });

  factory TaskAcceptedOrRejected.fromJson(Map<String, dynamic> json) {
    return _$TaskAcceptedOrRejectedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskAcceptedOrRejectedToJson(this);
}
