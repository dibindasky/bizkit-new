import 'package:json_annotation/json_annotation.dart';

part 'edit_sub_task_model.g.dart';

@JsonSerializable()
class EditSubTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'sub_task_id')
  String? subTaskId;
  String? title;

  EditSubTaskModel({this.taskId, this.subTaskId, this.title});

  factory EditSubTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditSubTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditSubTaskModelToJson(this);
}
