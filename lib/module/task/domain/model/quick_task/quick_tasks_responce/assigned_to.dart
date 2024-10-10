import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class AssignedTo {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;

  AssignedTo({this.userId, this.name, this.profilePicture});

  factory AssignedTo.fromJson(Map<String, dynamic> json) {
    return _$AssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);
}
