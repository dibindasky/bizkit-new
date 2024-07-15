import 'package:json_annotation/json_annotation.dart';

part 'folder_add_model.g.dart';

@JsonSerializable()
class FolderAddModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  List<String>? tasks;

  FolderAddModel({this.folderId, this.tasks});

  factory FolderAddModel.fromJson(Map<String, dynamic> json) {
    return _$FolderAddModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FolderAddModelToJson(this);
}
