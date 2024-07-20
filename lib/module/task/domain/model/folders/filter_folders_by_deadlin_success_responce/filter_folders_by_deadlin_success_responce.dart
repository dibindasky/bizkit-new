import 'package:json_annotation/json_annotation.dart';

import 'filtered_folder.dart';

part 'filter_folders_by_deadlin_success_responce.g.dart';

@JsonSerializable()
class FilterFoldersByDeadlinSuccessResponce {
  @JsonKey(name: 'filtered_folders')
  List<FilteredFolders>? filteredFolders;

  FilterFoldersByDeadlinSuccessResponce({this.filteredFolders});

  factory FilterFoldersByDeadlinSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$FilterFoldersByDeadlinSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilterFoldersByDeadlinSuccessResponceToJson(this);
  }
}
