import 'package:json_annotation/json_annotation.dart';

part 'merge_inner_folder_model.g.dart';

@JsonSerializable()
class MergeInnerFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'inner_folders')
  List<String>? innerFolders;
  @JsonKey(name: 'new_inner_folder_name')
  String? newInnerFolderName;

  MergeInnerFolderModel({
    this.folderId,
    this.innerFolders,
    this.newInnerFolderName,
  });

  factory MergeInnerFolderModel.fromJson(Map<String, dynamic> json) {
    return _$MergeInnerFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MergeInnerFolderModelToJson(this);
}
