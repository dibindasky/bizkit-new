import 'package:json_annotation/json_annotation.dart';

part 'personal_dayes_to_reminder_model.g.dart';

@JsonSerializable()
class PersonalDayesToReminderModel {
  String? date;
  String? description;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'date_id')
  String? dateId;

  PersonalDayesToReminderModel({
    this.date,
    this.description,
    this.dateId,
    this.bizcardId,
    this.personalDetailsId,
  });

  factory PersonalDayesToReminderModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalDayesToReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDayesToReminderModelToJson(this);
}
