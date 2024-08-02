import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';

part 'remove_user_from_assigned_model.g.dart';

@JsonSerializable()
class RemoveUserFromAssignedModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;

  RemoveUserFromAssignedModel({this.taskId, this.assignedTo});

  factory RemoveUserFromAssignedModel.fromJson(Map<String, dynamic> json) {
    return _$RemoveUserFromAssignedModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RemoveUserFromAssignedModelToJson(this);
}
