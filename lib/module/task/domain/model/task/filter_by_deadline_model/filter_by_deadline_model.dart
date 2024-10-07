import 'package:json_annotation/json_annotation.dart';

part 'filter_by_deadline_model.g.dart';

@JsonSerializable()
class FilterByDeadlineModel {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  FilterByDeadlineModel({this.date, this.page, this.pageSize});

  factory FilterByDeadlineModel.fromJson(Map<String, dynamic> json) {
    return _$FilterByDeadlineModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterByDeadlineModelToJson(this);
}
