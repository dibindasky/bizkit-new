import 'package:json_annotation/json_annotation.dart';

part 'accept_or_reject_model.g.dart';

@JsonSerializable()
class AcceptOrRejectModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'acceptance_status')
  String? acceptanceStatus;
  @JsonKey(name: 'task_type')
  String? taskType;

  AcceptOrRejectModel({this.taskId, this.acceptanceStatus, this.taskType});

  factory AcceptOrRejectModel.fromJson(Map<String, dynamic> json) {
    return _$AcceptOrRejectModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptOrRejectModelToJson(this);
}