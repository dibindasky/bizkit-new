import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class TaskAssignedTo {
  String? user;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;
  String? name;

  TaskAssignedTo({this.user, this.isAccepted, this.name});

  factory TaskAssignedTo.fromJson(Map<String, dynamic> json) {
    return _$TaskAssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskAssignedToToJson(this);
}
