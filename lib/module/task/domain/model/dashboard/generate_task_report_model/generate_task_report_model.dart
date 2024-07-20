import 'package:json_annotation/json_annotation.dart';

part 'generate_task_report_model.g.dart';

@JsonSerializable()
class GenerateTaskReportModel {
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

  GenerateTaskReportModel({
    this.taskMentionedType,
    this.taskType,
    this.priorityLevel,
    this.fromDate,
    this.toDate,
  });

  factory GenerateTaskReportModel.fromJson(Map<String, dynamic> json) {
    return _$GenerateTaskReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerateTaskReportModelToJson(this);
}
