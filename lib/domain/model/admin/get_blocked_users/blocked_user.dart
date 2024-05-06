import 'package:json_annotation/json_annotation.dart';

part 'blocked_user.g.dart';

@JsonSerializable()
class BlockedDUser {
  int? id;
  String? name;
  @JsonKey(name: 'profile_pic')
  String? profilePic;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'company_id')
  int? companyId;

  BlockedDUser({
    this.id,
    this.name,
    this.profilePic,
    this.userId,
    this.companyId,
  });

  factory BlockedDUser.fromJson(Map<String, dynamic> json) {
    return _$BlockedDUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockedDUserToJson(this);
}
