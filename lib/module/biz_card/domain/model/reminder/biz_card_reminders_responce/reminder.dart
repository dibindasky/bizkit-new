import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';

@JsonSerializable()
class BizCardReminder {
  @JsonKey(name: 'reminder_id')
  String? reminderId;
  @JsonKey(name: 'reminder_date')
  String? reminderDate;
  String? description;
  String? venue;
  String? occasion;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;

  BizCardReminder({
    this.reminderId,
    this.reminderDate,
    this.description,
    this.venue,
    this.occasion,
    this.meetingLabel,
  });

  factory BizCardReminder.fromJson(Map<String, dynamic> json) {
    return _$BizCardReminderReminderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizCardReminderReminderToJson(this);
}
