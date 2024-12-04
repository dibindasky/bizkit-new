import 'package:json_annotation/json_annotation.dart';

part 'recent_visit_log.g.dart';

@JsonSerializable()
class RecentVisitLog {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? email;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  String? designation;
  String? time;

  RecentVisitLog({
    this.userId,
    this.name,
    this.email,
    this.profilePicture,
    this.designation,
    this.time,
  });

  factory RecentVisitLog.fromJson(Map<String, dynamic> json) {
    return _$RecentVisitLogFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecentVisitLogToJson(this);
}
