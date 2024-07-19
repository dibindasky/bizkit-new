import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_tasks_inside_folder_success_responce.g.dart';

@JsonSerializable()
class GetTasksInsideFolderSuccessResponce {
  List<InSideFolderDatum>? data;

  GetTasksInsideFolderSuccessResponce({this.data});

  factory GetTasksInsideFolderSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$GetTasksInsideFolderSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetTasksInsideFolderSuccessResponceToJson(this);
  }
}
