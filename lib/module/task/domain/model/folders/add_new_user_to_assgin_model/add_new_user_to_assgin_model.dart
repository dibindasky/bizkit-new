import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';

part 'add_new_user_to_assgin_model.g.dart';

@JsonSerializable()
class AddNewUserToAssginModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;

  AddNewUserToAssginModel({this.taskId, this.assignedTo});

  factory AddNewUserToAssginModel.fromJson(Map<String, dynamic> json) {
    return _$AddNewUserToAssginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddNewUserToAssginModelToJson(this);
}
