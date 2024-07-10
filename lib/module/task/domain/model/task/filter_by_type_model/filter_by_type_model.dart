import 'package:json_annotation/json_annotation.dart';

part 'filter_by_type_model.g.dart';

@JsonSerializable()
class FilterByTypeModel {
  @JsonKey(name: 'task_type')
  String? taskType;

  FilterByTypeModel({this.taskType});

  factory FilterByTypeModel.fromJson(Map<String, dynamic> json) {
    return _$FilterByTypeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByTypeModelToJson(this);
}
