import 'package:json_annotation/json_annotation.dart';

part 'filtered_folder.g.dart';

@JsonSerializable()
class FilteredFolders {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'folder_name')
  String? folderName;
  @JsonKey(name: 'tasks_count')
  int? tasksCount;

  FilteredFolders({this.folderId, this.folderName, this.tasksCount});

  factory FilteredFolders.fromJson(Map<String, dynamic> json) {
    return _$FilteredFoldersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilteredFoldersToJson(this);

  // Adding the copyWith method
  FilteredFolders copyWith({
    String? folderId,
    String? folderName,
    int? tasksCount,
  }) {
    return FilteredFolders(
      folderId: folderId ?? this.folderId,
      folderName: folderName ?? this.folderName,
      tasksCount: tasksCount ?? this.tasksCount,
    );
  }
}
