import 'package:json_annotation/json_annotation.dart';

part 'pinned_a_task_model.g.dart';

@JsonSerializable()
class PinnedATaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  PinnedATaskModel({this.taskId, this.isPinned});

  factory PinnedATaskModel.fromJson(Map<String, dynamic> json) {
    return _$PinnedATaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PinnedATaskModelToJson(this);
}
