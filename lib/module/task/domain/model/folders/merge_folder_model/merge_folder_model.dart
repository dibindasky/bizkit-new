import 'package:json_annotation/json_annotation.dart';

part 'merge_folder_model.g.dart';

@JsonSerializable()
class MergeFolderModel {
  @JsonKey(name: 'folder_name')
  String? folderName;
  List<String>? folders;

  MergeFolderModel({this.folderName, this.folders});

  factory MergeFolderModel.fromJson(Map<String, dynamic> json) {
    return _$MergeFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MergeFolderModelToJson(this);
}
