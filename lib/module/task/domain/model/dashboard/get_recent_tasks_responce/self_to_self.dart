import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'self_to_self.g.dart';

@JsonSerializable()
class SelfToSelf {
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

  SelfToSelf({
    this.taskId,
    this.taskTitle,
    this.createdAt,
    this.deadLine,
    this.isOwned,
    this.status,
    this.createdBy,
  });

  factory SelfToSelf.fromJson(Map<String, dynamic> json) {
    return _$SelfToSelfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToSelfToJson(this);
}
