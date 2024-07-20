import 'package:json_annotation/json_annotation.dart';

part 'filter_folder_by_deadline_model.g.dart';

@JsonSerializable()
class FilterFolderByDeadlineModel {
  @JsonKey(name: 'filter_date')
  String? filterDate;

  FilterFolderByDeadlineModel({this.filterDate});

  factory FilterFolderByDeadlineModel.fromJson(Map<String, dynamic> json) {
    return _$FilterFolderByDeadlineModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterFolderByDeadlineModelToJson(this);
}
