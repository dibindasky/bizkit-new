import 'package:json_annotation/json_annotation.dart';

part 'delete_sub_task_model.g.dart';

@JsonSerializable()
class DeleteSubTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'sub_task_id')
  String? subTaskId;

  DeleteSubTaskModel({this.taskId, this.subTaskId});

  factory DeleteSubTaskModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteSubTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteSubTaskModelToJson(this);
}
