import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_tasks_inner_folder_responce.g.dart';

@JsonSerializable()
class GetAllTasksInnerFolderResponce {
  List<Datum>? data;

  GetAllTasksInnerFolderResponce({this.data});

  factory GetAllTasksInnerFolderResponce.fromJson(Map<String, dynamic> json) {
    return _$GetAllTasksInnerFolderResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllTasksInnerFolderResponceToJson(this);
  }
}
