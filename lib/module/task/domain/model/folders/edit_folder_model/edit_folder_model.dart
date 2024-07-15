import 'package:json_annotation/json_annotation.dart';

part 'edit_folder_model.g.dart';

@JsonSerializable()
class EditFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'folder_name')
  String? folderName;

  EditFolderModel({this.folderId, this.folderName});

  factory EditFolderModel.fromJson(Map<String, dynamic> json) {
    return _$EditFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditFolderModelToJson(this);
}
