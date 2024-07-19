import 'package:json_annotation/json_annotation.dart';

import 'inner_folder_task.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'inner_folder_name')
  String? innerFolderName;
  @JsonKey(name: 'inner_folder_tasks')
  List<InnerFolderTask>? innerFolderTasks;

  Datum({this.id, this.innerFolderName, this.innerFolderTasks});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
