import 'package:json_annotation/json_annotation.dart';

part 'others_to_self.g.dart';

@JsonSerializable()
class OthersToSelf {
  int? all;
  int? progressing;
  int? killed;
  @JsonKey(name: 'deadline_over')
  int? deadlineOver;
  int? completed;

  OthersToSelf(
      {this.all,
      this.progressing,
      this.killed,
      this.deadlineOver,
      this.completed});

  factory OthersToSelf.fromJson(Map<String, dynamic> json) {
    return _$OthersToSelfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OthersToSelfToJson(this);
}
