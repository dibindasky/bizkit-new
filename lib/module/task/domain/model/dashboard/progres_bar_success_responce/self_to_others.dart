import 'package:json_annotation/json_annotation.dart';

part 'self_to_others.g.dart';

@JsonSerializable()
class SelfToOthers {
  int? all;
  int? progressing;
  int? killed;
  @JsonKey(name: 'deadline_over')
  int? deadlineOver;
  int? completed;

  SelfToOthers({
    this.all,
    this.progressing,
    this.killed,
    this.deadlineOver,
    this.completed,
  });

  factory SelfToOthers.fromJson(Map<String, dynamic> json) {
    return _$SelfToOthersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToOthersToJson(this);
}
