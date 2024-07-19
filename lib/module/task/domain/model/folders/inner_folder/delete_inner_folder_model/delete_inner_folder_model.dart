import 'package:json_annotation/json_annotation.dart';

part 'delete_inner_folder_model.g.dart';

@JsonSerializable()
class DeleteInnerFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;

  DeleteInnerFolderModel({this.folderId, this.innerFolderId});

  factory DeleteInnerFolderModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteInnerFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteInnerFolderModelToJson(this);
}
