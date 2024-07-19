import 'package:json_annotation/json_annotation.dart';

part 'self_to_self.g.dart';

@JsonSerializable()
class SelfToSelf {
  int? all;
  int? progressing;
  int? killed;
  @JsonKey(name: 'deadline_over')
  int? deadlineOver;
  int? completed;

  SelfToSelf({
    this.all,
    this.progressing,
    this.killed,
    this.deadlineOver,
    this.completed,
  });

  factory SelfToSelf.fromJson(Map<String, dynamic> json) {
    return _$SelfToSelfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToSelfToJson(this);
}
