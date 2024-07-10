import 'package:json_annotation/json_annotation.dart';

part 'kill_a_task_model.g.dart';

@JsonSerializable()
class KillATaskModel {
  @JsonKey(name: 'is_killed')
  bool? isKilled;
  @JsonKey(name: 'task_id')
  String? taskId;

  KillATaskModel({this.isKilled, this.taskId});

  factory KillATaskModel.fromJson(Map<String, dynamic> json) {
    return _$KillATaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KillATaskModelToJson(this);
}
