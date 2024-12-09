import 'package:json_annotation/json_annotation.dart';

part 'quick_task_accept_or_reject.g.dart';

@JsonSerializable()
class QuickTaskAcceptOrReject {
  @JsonKey(name: 'quick_task_id')
  String? quickTaskId;
  String? status;

  QuickTaskAcceptOrReject({this.quickTaskId, this.status});

  factory QuickTaskAcceptOrReject.fromJson(Map<String, dynamic> json) {
    return _$QuickTaskAcceptOrRejectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuickTaskAcceptOrRejectToJson(this);
}
