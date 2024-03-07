import 'package:json_annotation/json_annotation.dart';

part 'reminders.g.dart';

@JsonSerializable()
class Reminders {
  int? id;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  String? message;
  String? venue;
  String? name;
  String? image;
  String? occation;
  String? date;
  String? time;
  bool? archived;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_holder_id')
  int? cardHolderId;
  @JsonKey(name: 'card_id')
  int? cardId;
  @JsonKey(name: 'connection_id')
  int? connectionId;

  Reminders({
    this.id,
    this.meetingLabel,
    this.message,
    this.venue,
    this.occation,
    this.date,
    this.time,
    this.archived,
    this.createdAt,
    this.userId,
    this.cardHolderId,
    this.cardId,
    this.connectionId,
  });

  factory Reminders.fromJson(Map<String, dynamic> json) {
    return _$RemindersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RemindersToJson(this);
}
