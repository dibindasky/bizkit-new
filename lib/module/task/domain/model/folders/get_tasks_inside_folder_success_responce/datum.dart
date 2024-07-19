import 'package:json_annotation/json_annotation.dart';

import 'inner_folder.dart';
import 'task.dart';

part 'datum.g.dart';

@JsonSerializable()
class InSideFolderDatum {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'folder_name')
  String? folderName;
  List<InsideAFolderTasks>? tasks;
  @JsonKey(name: 'inner_folders')
  List<InnerFolder>? innerFolders;

  InSideFolderDatum({this.id, this.folderName, this.tasks, this.innerFolders});

  factory InSideFolderDatum.fromJson(Map<String, dynamic> json) =>
      _$InSideFolderDatumFromJson(json);

  Map<String, dynamic> toJson() => _$InSideFolderDatumToJson(this);
}
