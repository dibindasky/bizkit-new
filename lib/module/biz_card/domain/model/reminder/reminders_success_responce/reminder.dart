import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'reminder_id')
  String? reminderId;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'card_id')
  String? cardId;
  String? venue;
  String? occasion;
  @JsonKey(name: 'reminder_date')
  String? reminderDate;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  String? description;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  @JsonKey(name: 'owner_name')
  String? ownerName;

  Reminder({
    this.id,
    this.userId,
    this.cardId,
    this.venue,
    this.occasion,
    this.reminderDate,
    this.profilePicture,
    this.description,
    this.meetingLabel,
    this.ownerName,
    this.reminderId,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return _$ReminderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
