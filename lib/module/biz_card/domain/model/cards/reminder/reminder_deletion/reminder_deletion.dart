import 'package:json_annotation/json_annotation.dart';

part 'reminder_deletion.g.dart';

@JsonSerializable()
class ReminderDeletion {
  @JsonKey(name: 'date_id')
  String? dateId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;

  ReminderDeletion({this.dateId, this.personalDetailsId});

  factory ReminderDeletion.fromJson(Map<String, dynamic> json) {
    return _$ReminderDeletionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderDeletionToJson(this);
}
