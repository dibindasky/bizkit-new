import 'package:json_annotation/json_annotation.dart';

part 'folder_model.g.dart';

@JsonSerializable()
class FolderModel {
  @JsonKey(name: 'folder_name')
  String? folderName;
  List<String>? tasks;

  FolderModel({this.folderName, this.tasks});

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return _$FolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FolderModelToJson(this);
}
