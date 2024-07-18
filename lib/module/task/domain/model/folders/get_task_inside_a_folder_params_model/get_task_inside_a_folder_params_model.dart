import 'package:json_annotation/json_annotation.dart';

part 'get_task_inside_a_folder_params_model.g.dart';

@JsonSerializable()
class GetTaskInsideAFolderParamsModel {
  @JsonKey(name: 'folder_id')
  String? folderId;

  GetTaskInsideAFolderParamsModel({this.folderId});

  factory GetTaskInsideAFolderParamsModel.fromJson(Map<String, dynamic> json) {
    return _$GetTaskInsideAFolderParamsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetTaskInsideAFolderParamsModelToJson(this);
  }
}
