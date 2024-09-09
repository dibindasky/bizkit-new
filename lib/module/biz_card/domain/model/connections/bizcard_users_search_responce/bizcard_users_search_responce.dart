import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'bizcard_users_search_responce.g.dart';

@JsonSerializable()
class BizcardUsersSearchResponce {
  List<BizCardUsers>? results;

  BizcardUsersSearchResponce({this.results});

  factory BizcardUsersSearchResponce.fromJson(Map<String, dynamic> json) {
    return _$BizcardUsersSearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardUsersSearchResponceToJson(this);
}
