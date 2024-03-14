import 'package:json_annotation/json_annotation.dart';

part 'report_a_problem_request_model.g.dart';

@JsonSerializable()
class ReportAProblemRequestModel {
  String? label;
  String? message;

  ReportAProblemRequestModel({this.label, this.message});

  factory ReportAProblemRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ReportAProblemRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportAProblemRequestModelToJson(this);
}
