import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_assined_users_model.g.dart';

@JsonSerializable()
class AddNewAssinedUsersModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'assigned_to')
  List<AssignedToDetail>? assignedTo;

  AddNewAssinedUsersModel({this.taskId, this.assignedTo});

  factory AddNewAssinedUsersModel.fromJson(Map<String, dynamic> json) {
    return _$AddNewAssinedUsersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddNewAssinedUsersModelToJson(this);
}
