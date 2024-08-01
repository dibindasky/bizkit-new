import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'get_report_success_responce.g.dart';

@JsonSerializable()
class GetReportSuccessResponce {
  List<ReportTask>? tasks;

  GetReportSuccessResponce({this.tasks});

  factory GetReportSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$GetReportSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReportSuccessResponceToJson(this);
}
