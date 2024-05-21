import 'package:json_annotation/json_annotation.dart';

import 'blocked_user.dart';

part 'get_blocked_users.g.dart';

@JsonSerializable()
class GetBlockedUsers {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<BlockedDUser>? blockedUsers;

  GetBlockedUsers({this.count, this.next, this.previous, this.blockedUsers});

  factory GetBlockedUsers.fromJson(Map<String, dynamic> json) {
    return _$GetBlockedUsersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetBlockedUsersToJson(this);
}
