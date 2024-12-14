import 'package:json_annotation/json_annotation.dart';

part 'bizcard_single_notification.g.dart';

@JsonSerializable()
class BizcardSingleNotification {
  String? type;
  String? title;
  String? message;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'connection_id')
  String? connectionId;

  BizcardSingleNotification({
    this.type,
    this.title,
    this.message,
    this.bizcardId,
    this.createdAt,
    this.connectionId,
  });

  factory BizcardSingleNotification.fromJson(Map<String, dynamic> json) {
    return _$BizcardSingleNotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardSingleNotificationToJson(this);
}
