import 'package:json_annotation/json_annotation.dart';

part 'filtered_folder.g.dart';

@JsonSerializable()
class FilteredFolder {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;
  @JsonKey(name: 'inner_folder_name')
  String? innerFolderName;
  @JsonKey(name: 'tasks_count')
  int? tasksCount;

  FilteredFolder({
    this.folderId,
    this.innerFolderId,
    this.innerFolderName,
    this.tasksCount,
  });

  factory FilteredFolder.fromJson(Map<String, dynamic> json) {
    return _$FilteredFolderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilteredFolderToJson(this);
}
