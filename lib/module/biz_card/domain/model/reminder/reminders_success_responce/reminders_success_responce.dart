import 'package:json_annotation/json_annotation.dart';

import 'reminder.dart';

part 'reminders_success_responce.g.dart';

@JsonSerializable()
class RemindersSuccessResponce {
  List<Reminder>? reminders;

  RemindersSuccessResponce({this.reminders});

  factory RemindersSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$RemindersSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RemindersSuccessResponceToJson(this);
}
