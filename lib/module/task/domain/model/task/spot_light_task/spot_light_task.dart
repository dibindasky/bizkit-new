import 'package:json_annotation/json_annotation.dart';

part 'spot_light_task.g.dart';

@JsonSerializable()
class SpotLightTask {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'spot_light_status')
  bool? spotLightStatus;

  SpotLightTask({this.taskId, this.spotLightStatus});

  factory SpotLightTask.fromJson(Map<String, dynamic> json) =>
      _$SpotLightTaskFromJson(json);

  Map<String, dynamic> toJson() => _$SpotLightTaskToJson(this);
}
