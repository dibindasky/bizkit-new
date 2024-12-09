import 'package:json_annotation/json_annotation.dart';

part 'quick_task_assigned_to.g.dart';

@JsonSerializable()
class QuickTaskAssignedTo {
  @JsonKey(name: 'user_id')
  String? userId;
  String? status;

  QuickTaskAssignedTo({this.userId, this.status});

  factory QuickTaskAssignedTo.fromJson(Map<String, dynamic> json) {
    return _$QuickTaskAssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuickTaskAssignedToToJson(this);
}
