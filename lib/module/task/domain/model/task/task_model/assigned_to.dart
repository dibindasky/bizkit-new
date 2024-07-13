import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class TaskAssignedTo {
  String? user;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;

  TaskAssignedTo({this.user, this.isAccepted});

  factory TaskAssignedTo.fromJson(Map<String, dynamic> json) {
    return _$TaskAssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskAssignedToToJson(this);
}
