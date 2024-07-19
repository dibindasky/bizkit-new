import 'package:json_annotation/json_annotation.dart';

part 'task_add_or_delete_inner_folder_model.g.dart';

@JsonSerializable()
class TaskAddOrDeleteInnerFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;
  @JsonKey(name: 'inner_folder_tasks')
  List<String>? innerFolderTasks;

  TaskAddOrDeleteInnerFolderModel({
    this.folderId,
    this.innerFolderId,
    this.innerFolderTasks,
  });

  factory TaskAddOrDeleteInnerFolderModel.fromJson(Map<String, dynamic> json) {
    return _$TaskAddOrDeleteInnerFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskAddOrDeleteInnerFolderModelToJson(this);
  }
}
