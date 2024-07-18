import 'package:json_annotation/json_annotation.dart';

part 'merge_folder_success_responce.g.dart';

@JsonSerializable()
class MergeFolderSuccessResponce {
  String? message;
  @JsonKey(name: 'new_folder_id')
  String? newFolderId;

  MergeFolderSuccessResponce({this.message, this.newFolderId});

  factory MergeFolderSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$MergeFolderSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MergeFolderSuccessResponceToJson(this);
}
