import 'package:json_annotation/json_annotation.dart';

part 'complete_quick_task.g.dart';

@JsonSerializable()
class CompleteQuickTask {
  @JsonKey(name: 'quick_task_id')
  String? quickTaskId;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  CompleteQuickTask({this.quickTaskId, this.isCompleted});

  factory CompleteQuickTask.fromJson(Map<String, dynamic> json) {
    return _$CompleteQuickTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompleteQuickTaskToJson(this);
}
