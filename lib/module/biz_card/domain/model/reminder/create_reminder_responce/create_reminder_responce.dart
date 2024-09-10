import 'package:json_annotation/json_annotation.dart';

part 'create_reminder_responce.g.dart';

@JsonSerializable()
class CreateReminderResponce {
  String? message;
  @JsonKey(name: 'reminder_id')
  String? reminderId;

  CreateReminderResponce({this.message, this.reminderId});

  factory CreateReminderResponce.fromJson(Map<String, dynamic> json) {
    return _$CreateReminderResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateReminderResponceToJson(this);
}
