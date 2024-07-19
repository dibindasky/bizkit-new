import 'package:json_annotation/json_annotation.dart';

part 'inner_folder_tasks_get_params_model.g.dart';

@JsonSerializable()
class InnerFolderTasksGetParamsModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;

  InnerFolderTasksGetParamsModel({this.folderId, this.innerFolderId});

  factory InnerFolderTasksGetParamsModel.fromJson(Map<String, dynamic> json) {
    return _$InnerFolderTasksGetParamsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InnerFolderTasksGetParamsModelToJson(this);
  }
}
