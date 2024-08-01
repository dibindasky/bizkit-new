import 'package:json_annotation/json_annotation.dart';

part 'genearate_report_model.g.dart';

@JsonSerializable()
class GenearateReportModel {
  @JsonKey(name: 'task_ids')
  List<String>? taskIds;
  List<String>? fields;
  @JsonKey(name: 'report_type')
  String? reportType;

  GenearateReportModel({this.taskIds, this.fields, this.reportType});

  factory GenearateReportModel.fromJson(Map<String, dynamic> json) {
    return _$GenearateReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenearateReportModelToJson(this);
}
