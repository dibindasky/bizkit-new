import 'package:json_annotation/json_annotation.dart';

part 'filter_by_deadline_model.g.dart';

@JsonSerializable()
class FilterByDeadlineModel {
  // Local ID
  int? localId;

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

  static const colTaskFilterByDeadlineLocalId =
      'task_filter_by_deadline_local_id';
  static const colUserId = 'user_id';
  static const colTaskFilterByDeadline = 'task_filter_by_deadline';
  static const colTaskFilterByDeadlineReferenceId =
      'task_filter_by_deadline_reference_id ';
}
