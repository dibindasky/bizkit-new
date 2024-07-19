import 'package:json_annotation/json_annotation.dart';

part 'edit_inner_folder_model.g.dart';

@JsonSerializable()
class EditInnerFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;
  @JsonKey(name: 'inner_folder_name')
  String? innerFolderName;

  EditInnerFolderModel({
    this.folderId,
    this.innerFolderId,
    this.innerFolderName,
  });

  factory EditInnerFolderModel.fromJson(Map<String, dynamic> json) {
    return _$EditInnerFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditInnerFolderModelToJson(this);
}
