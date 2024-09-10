import 'package:json_annotation/json_annotation.dart';

part 'create_reminder_model.g.dart';

@JsonSerializable()
class CreateReminderModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  String? venue;
  String? occasion;
  String? description;
  @JsonKey(name: 'reminder_date')
  String? reminderDate;

  CreateReminderModel({
    this.bizcardId,
    this.venue,
    this.occasion,
    this.description,
    this.reminderDate,
  });

  factory CreateReminderModel.fromJson(Map<String, dynamic> json) {
    return _$CreateReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateReminderModelToJson(this);
}
