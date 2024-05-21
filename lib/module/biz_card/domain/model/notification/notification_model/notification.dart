import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  int? id;
  String? title;
  String? body;
  String? tag;
  @JsonKey(name: 'specific_id')
  int? cardId;
  @JsonKey(name: 'scheduled_at')
  String? scheduledAt;
  @JsonKey(name: 'user_id')
  int? userId;

  Notification({
    this.id,
    this.title,
    this.body,
    this.tag,
    this.cardId,
    this.scheduledAt,
    this.userId,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return _$NotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
