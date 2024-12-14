import 'package:json_annotation/json_annotation.dart';

part 'filtered_folder.g.dart';

@JsonSerializable()
class FilteredFolder {
  @JsonKey(name: 'folder_id')
  final String? folderId;
  @JsonKey(name: 'inner_folder_id')
  final String? innerFolderId;
  @JsonKey(name: 'inner_folder_name')
  final String? innerFolderName;
  @JsonKey(name: 'tasks_count')
  final int? tasksCount;

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

  // Add copyWith method
  FilteredFolder copyWith({
    String? folderId,
    String? innerFolderId,
    String? innerFolderName,
    int? tasksCount,
  }) {
    return FilteredFolder(
      folderId: folderId ?? this.folderId,
      innerFolderId: innerFolderId ?? this.innerFolderId,
      innerFolderName: innerFolderName ?? this.innerFolderName,
      tasksCount: tasksCount ?? this.tasksCount,
    );
  }
}
