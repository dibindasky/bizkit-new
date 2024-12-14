import 'package:json_annotation/json_annotation.dart';

part 'bizcard_notification.g.dart';

@JsonSerializable()
class BizcardNotification {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  String? title;
  String? message;
  @JsonKey(name: 'is_read')
  bool? isRead;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'notification_type')
  String? notificationType;
  @JsonKey(name: 'connection_id')
  String? connectionId;

  BizcardNotification({
    this.id,
    this.userId,
    this.bizcardId,
    this.title,
    this.message,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.notificationType,
    this.connectionId,
  });

  factory BizcardNotification.fromJson(Map<String, dynamic> json) {
    return _$BizcardNotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardNotificationToJson(this);
}
