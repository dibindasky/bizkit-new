import 'package:json_annotation/json_annotation.dart';

part 'sub_task.g.dart';

@JsonSerializable()
class SubTask {
  String? title;
  String? description;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  SubTask({this.title, this.description, this.isCompleted});

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return _$SubTaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubTaskToJson(this);
}
