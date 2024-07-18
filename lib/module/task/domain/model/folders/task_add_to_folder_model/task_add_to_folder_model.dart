import 'package:json_annotation/json_annotation.dart';

part 'task_add_to_folder_model.g.dart';

@JsonSerializable()
class TaskAddToFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  List<String>? tasks;

  TaskAddToFolderModel({this.folderId, this.tasks});

  factory TaskAddToFolderModel.fromJson(Map<String, dynamic> json) {
    return _$TaskAddToFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskAddToFolderModelToJson(this);
}
