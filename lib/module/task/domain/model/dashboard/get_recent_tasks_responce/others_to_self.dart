import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'others_to_self.g.dart';

@JsonSerializable()
class OthersToSelf {
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

  OthersToSelf({
    this.taskId,
    this.taskTitle,
    this.createdAt,
    this.deadLine,
    this.isOwned,
    this.status,
    this.createdBy,
  });

  factory OthersToSelf.fromJson(Map<String, dynamic> json) {
    return _$OthersToSelfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OthersToSelfToJson(this);
}
