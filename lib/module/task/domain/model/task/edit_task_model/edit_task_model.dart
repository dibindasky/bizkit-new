import 'package:json_annotation/json_annotation.dart';

part 'edit_task_model.g.dart';

@JsonSerializable()
class EditTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'dead_line')
  String? deadLine;

  EditTaskModel({this.taskId, this.deadLine});

  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
}
