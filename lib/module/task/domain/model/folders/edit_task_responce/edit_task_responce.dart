import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_task_responce.g.dart';

@JsonSerializable()
class EditTaskModel {
  String? title;
  String? description;
  List<String>? tags;
  @JsonKey(name: 'task_id')
  String? taskId;

  EditTaskModel({
    this.title,
    this.description,
    this.tags,
    this.taskId,
  });

  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return _$EditTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
}
