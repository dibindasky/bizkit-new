import 'package:bizkit/module/task/domain/model/quick_task/quick_task_assigned_to/quick_task_assigned_to.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_quick_task_model.g.dart';

@JsonSerializable()
class UpdateQuickTaskModel {
  @JsonKey(name: 'quick_task_id')
  String? quickTaskId;
  String? title;
  String? description;
  @JsonKey(name: 'assigned_to')
  List<QuickTaskAssignedTo>? assignedTo;

  UpdateQuickTaskModel({
    this.quickTaskId,
    this.title,
    this.description,
    this.assignedTo,
  });

  factory UpdateQuickTaskModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateQuickTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateQuickTaskModelToJson(this);
}
