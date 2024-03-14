import 'package:json_annotation/json_annotation.dart';

part 'report_a_problem_responce_model.g.dart';

@JsonSerializable()
class ReportAProblemResponceModel {
  int? id;
  String? label;
  String? message;
  @JsonKey(name: 'user_id')
  int? userId;

  ReportAProblemResponceModel({
    this.id,
    this.label,
    this.message,
    this.userId,
  });

  factory ReportAProblemResponceModel.fromJson(Map<String, dynamic> json) {
    return _$ReportAProblemResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportAProblemResponceModelToJson(this);
}
