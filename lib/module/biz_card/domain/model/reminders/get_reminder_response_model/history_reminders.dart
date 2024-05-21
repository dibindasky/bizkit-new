import 'package:json_annotation/json_annotation.dart';

part 'history_reminders.g.dart';

@JsonSerializable()
class HistoryReminders {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_holder_id')
  int? cardHolderId;
  @JsonKey(name: 'card_id')
  int? cardId;
  @JsonKey(name: 'connection_id')
  int? connectionId;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  String? message;
  String? venue;
  String? occation;
  String? date;
  String? time;
  @JsonKey(name: 'is_archived')
  bool? isArchived;

  HistoryReminders({
    this.id,
    this.userId,
    this.cardHolderId,
    this.cardId,
    this.connectionId,
    this.meetingLabel,
    this.message,
    this.venue,
    this.occation,
    this.date,
    this.time,
    this.isArchived,
  });

  factory HistoryReminders.fromJson(Map<String, dynamic> json) {
    return _$HistoryRemindersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRemindersToJson(this);
}
