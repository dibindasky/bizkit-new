import 'package:json_annotation/json_annotation.dart';

part 'unpin_a_task_model.g.dart';

@JsonSerializable()
class UnpinATaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;

  UnpinATaskModel({this.taskId, this.isPinned});

  factory UnpinATaskModel.fromJson(Map<String, dynamic> json) {
    return _$UnpinATaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnpinATaskModelToJson(this);
}
