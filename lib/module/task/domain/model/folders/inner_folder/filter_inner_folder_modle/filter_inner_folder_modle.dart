import 'package:json_annotation/json_annotation.dart';

part 'filter_inner_folder_modle.g.dart';

@JsonSerializable()
class FilterInnerFolderModel {
  @JsonKey(name: 'folder_id')
  String? folderId;
  @JsonKey(name: 'filter_date')
  String? filterDate;

  FilterInnerFolderModel({this.folderId, this.filterDate});

  factory FilterInnerFolderModel.fromJson(Map<String, dynamic> json) {
    return _$FilterInnerFolderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterInnerFolderModelToJson(this);
}
