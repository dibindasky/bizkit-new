import 'package:json_annotation/json_annotation.dart';

part 'visit_log.g.dart';

@JsonSerializable()
class VisitLog {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? email;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  String? designation;
  String? time;

  VisitLog({
    this.userId,
    this.name,
    this.email,
    this.profilePicture,
    this.designation,
    this.time,
  });

  factory VisitLog.fromJson(Map<String, dynamic> json) {
    return _$VisitLogFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VisitLogToJson(this);
}
