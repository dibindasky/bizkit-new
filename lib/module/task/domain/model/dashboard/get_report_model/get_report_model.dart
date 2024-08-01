import 'package:json_annotation/json_annotation.dart';

part 'get_report_model.g.dart';

@JsonSerializable()
class GetReportModel {
  @JsonKey(name: 'task_mentioned_type')
  List<String>? taskMentionedType;
  @JsonKey(name: 'task_type')
  List<String>? taskType;
  @JsonKey(name: 'priority_level')
  List<String>? priorityLevel;
  @JsonKey(name: 'from_date')
  String? fromDate;
  @JsonKey(name: 'to_date')
  String? toDate;
  @JsonKey(name: 'search_term')
  String? searchTerm;

  GetReportModel(
      {this.taskMentionedType,
      this.taskType,
      this.priorityLevel,
      this.fromDate,
      this.toDate,
      this.searchTerm});

  factory GetReportModel.fromJson(Map<String, dynamic> json) {
    return _$GetReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReportModelToJson(this);
}
