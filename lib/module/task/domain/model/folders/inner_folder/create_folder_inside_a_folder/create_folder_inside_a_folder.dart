import 'package:json_annotation/json_annotation.dart';

part 'create_folder_inside_a_folder.g.dart';

@JsonSerializable()
class CreateFolderInsideAFolder {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_name')
  String? innerFolderName;
  @JsonKey(name: 'inner_folder_tasks')
  List<dynamic>? innerFolderTasks;

  CreateFolderInsideAFolder({
    this.folderId,
    this.innerFolderName,
    this.innerFolderTasks,
  });

  factory CreateFolderInsideAFolder.fromJson(Map<String, dynamic> json) {
    return _$CreateFolderInsideAFolderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateFolderInsideAFolderToJson(this);
}
