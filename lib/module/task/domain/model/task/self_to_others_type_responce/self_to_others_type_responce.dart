import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'self_to_others_type_responce.g.dart';

@JsonSerializable()
class SelfToOthersTypeResponce {
  List<Task>? tasks;

  SelfToOthersTypeResponce({this.tasks});

  factory SelfToOthersTypeResponce.fromJson(Map<String, dynamic> json) {
    return _$SelfToOthersTypeResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToOthersTypeResponceToJson(this);
}
