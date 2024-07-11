import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  @JsonKey(name: '_id')
  String? id;
  Task? task;
  String? type;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;

  Task({
    this.id,
    this.task,
    this.type,
    this.isOwned,
    this.spotlightOn,
    this.isPinned,
    this.isAccepted,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
