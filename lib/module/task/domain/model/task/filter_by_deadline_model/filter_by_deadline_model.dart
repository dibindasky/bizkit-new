import 'package:json_annotation/json_annotation.dart';

part 'filter_by_deadline_model.g.dart';

@JsonSerializable()
class FilterByDeadlineModel {
  String? date;

  FilterByDeadlineModel({this.date});

  factory FilterByDeadlineModel.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByDeadlineModelToJson(this);
}
