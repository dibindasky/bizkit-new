import 'package:json_annotation/json_annotation.dart';

import 'others_to_self.dart';
import 'self_to_others.dart';
import 'self_to_self.dart';

part 'counts.g.dart';

@JsonSerializable()
class Counts {
  @JsonKey(name: 'self_to_self')
  SelfToSelf? selfToSelf;
  @JsonKey(name: 'self_to_others')
  SelfToOthers? selfToOthers;
  @JsonKey(name: 'others_to_self')
  OthersToSelf? othersToSelf;

  Counts({this.selfToSelf, this.selfToOthers, this.othersToSelf});

  factory Counts.fromJson(Map<String, dynamic> json) {
    return _$CountsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountsToJson(this);
}
