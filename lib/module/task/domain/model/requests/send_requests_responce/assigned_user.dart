import 'package:json_annotation/json_annotation.dart';

part 'assigned_user.g.dart';

@JsonSerializable()
class AssignedUser {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;

  AssignedUser({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.isAccepted,
  });

  factory AssignedUser.fromJson(Map<String, dynamic> json) {
    return _$AssignedUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedUserToJson(this);
}
