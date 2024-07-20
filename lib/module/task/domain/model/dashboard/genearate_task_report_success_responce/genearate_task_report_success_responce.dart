import 'package:json_annotation/json_annotation.dart';

part 'genearate_task_report_success_responce.g.dart';

@JsonSerializable()
class GenearateTaskReportSuccessResponce {
  String? report;

  GenearateTaskReportSuccessResponce({this.report});

  factory GenearateTaskReportSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$GenearateTaskReportSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenearateTaskReportSuccessResponceToJson(this);
  }
}
