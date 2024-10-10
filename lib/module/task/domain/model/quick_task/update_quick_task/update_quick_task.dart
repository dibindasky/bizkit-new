import 'package:json_annotation/json_annotation.dart';

part 'update_quick_task.g.dart';

@JsonSerializable()
class UpdateQuickTask {
  @JsonKey(name: 'quick_task_id')
  String? quickTaskId;
  @JsonKey(name: 'assigned_to')
  List<String>? assignedTo;

  UpdateQuickTask({this.quickTaskId, this.assignedTo});

  factory UpdateQuickTask.fromJson(Map<String, dynamic> json) {
    return _$UpdateQuickTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateQuickTaskToJson(this);
}
