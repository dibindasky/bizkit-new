import 'package:json_annotation/json_annotation.dart';

part 'inner_folder.g.dart';

@JsonSerializable()
class InnerFolder {
  @JsonKey(name: 'inner_folder_id')
  String? innerFolderId;
  @JsonKey(name: 'inner_folder_name')
  String? innerFolderName;

  InnerFolder({this.innerFolderId, this.innerFolderName});

  factory InnerFolder.fromJson(Map<String, dynamic> json) {
    return _$InnerFolderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InnerFolderToJson(this);
}
