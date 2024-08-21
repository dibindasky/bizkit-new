import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'self_to_other.g.dart';

@JsonSerializable()
class SelfToOther {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'task_title')
  String? taskTitle;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  String? status;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;

  SelfToOther({
    this.taskId,
    this.taskTitle,
    this.createdAt,
    this.deadLine,
    this.isOwned,
    this.status,
    this.createdBy,
  });

  factory SelfToOther.fromJson(Map<String, dynamic> json) {
    return _$SelfToOtherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToOtherToJson(this);
}
