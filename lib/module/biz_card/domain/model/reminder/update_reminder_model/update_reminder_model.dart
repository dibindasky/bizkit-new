import 'package:json_annotation/json_annotation.dart';

part 'update_reminder_model.g.dart';

@JsonSerializable()
class UpdateReminderModel {
  @JsonKey(name: 'reminder_id')
  String? reminderId;
  String? venue;
  String? occasion;
  String? description;
  @JsonKey(name: 'reminder_date')
  String? reminderDate;

  UpdateReminderModel({
    this.reminderId,
    this.venue,
    this.occasion,
    this.description,
    this.reminderDate,
  });

  factory UpdateReminderModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateReminderModelToJson(this);
}