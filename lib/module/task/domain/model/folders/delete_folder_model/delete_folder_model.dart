import 'package:json_annotation/json_annotation.dart';

part 'delete_folder_model.g.dart';

@JsonSerializable()
class DeleteFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;

  DeleteFolderModel({this.folderId});

  factory DeleteFolderModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteFolderModelToJson(this);
}
