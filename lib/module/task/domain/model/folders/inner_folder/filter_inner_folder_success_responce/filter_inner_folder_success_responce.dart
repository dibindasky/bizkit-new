import 'package:json_annotation/json_annotation.dart';

import 'filtered_folder.dart';

part 'filter_inner_folder_success_responce.g.dart';

@JsonSerializable()
class FilterInnerFolderSuccessResponce {
  @JsonKey(name: 'filtered_folders')
  List<FilteredFolder>? filteredFolders;

  FilterInnerFolderSuccessResponce({this.filteredFolders});

  factory FilterInnerFolderSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$FilterInnerFolderSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilterInnerFolderSuccessResponceToJson(this);
  }
}
