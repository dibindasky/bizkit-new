import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class QuickTaskAssignedToResponce {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? status;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;

  QuickTaskAssignedToResponce(
      {this.userId, this.name, this.profilePicture, this.status});

  factory QuickTaskAssignedToResponce.fromJson(Map<String, dynamic> json) {
    return _$AssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);
}
