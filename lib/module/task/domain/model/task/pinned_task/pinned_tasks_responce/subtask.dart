import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class Subtask {
  String? title;
  String? description;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'total_time_taken')
  String? totalTimeTaken;
  @JsonKey(name: '_id')
  String? id;

  Subtask({
    this.title,
    this.description,
    this.deadLine,
    this.isCompleted,
    this.totalTimeTaken,
    this.id,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return _$SubtaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubtaskToJson(this);
}
