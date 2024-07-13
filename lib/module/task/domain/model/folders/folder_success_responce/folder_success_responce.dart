import 'package:json_annotation/json_annotation.dart';

part 'folder_success_responce.g.dart';

@JsonSerializable()
class FolderSuccessResponce {
  String? message;
  @JsonKey(name: 'folder_id')
  String? folderId;

  FolderSuccessResponce({this.message, this.folderId});

  factory FolderSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$FolderSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FolderSuccessResponceToJson(this);
}
