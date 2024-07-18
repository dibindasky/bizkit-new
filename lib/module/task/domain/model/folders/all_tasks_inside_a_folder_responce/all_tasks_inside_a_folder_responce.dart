import 'package:bizkit/module/task/domain/model/folders/all_tasks_inside_a_folder_responce/tasks_inside_folder/tasks_inside_folder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_tasks_inside_a_folder_responce.g.dart';

@JsonSerializable()
class AllTasksInsideAFolderResponce {
  List<TasksInsideFolder>? data;

  AllTasksInsideAFolderResponce({this.data});

  factory AllTasksInsideAFolderResponce.fromJson(Map<String, dynamic> json) {
    return _$AllTasksInsideAFolderResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllTasksInsideAFolderResponceToJson(this);
}
