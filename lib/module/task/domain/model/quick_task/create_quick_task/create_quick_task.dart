import 'package:bizkit/module/task/domain/model/quick_task/quick_task_assigned_to/quick_task_assigned_to.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_quick_task.g.dart';

@JsonSerializable()
class CreateQuickTask {
  String? title;
  String? description;
  @JsonKey(name: 'assigned_to')
  List<QuickTaskAssignedTo>? assignedTo;

  CreateQuickTask({this.title, this.description, this.assignedTo});

  factory CreateQuickTask.fromJson(Map<String, dynamic> json) {
    return _$CreateQuickTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateQuickTaskToJson(this);
}
