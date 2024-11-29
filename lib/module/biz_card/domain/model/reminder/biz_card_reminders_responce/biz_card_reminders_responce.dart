import 'package:json_annotation/json_annotation.dart';

import 'reminder.dart';

part 'biz_card_reminders_responce.g.dart';

@JsonSerializable()
class BizCardRemindersResponce {
  List<BizCardReminder>? reminders;

  BizCardRemindersResponce({this.reminders});

  factory BizCardRemindersResponce.fromJson(Map<String, dynamic> json) {
    return _$BizCardRemindersResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizCardRemindersResponceToJson(this);
}
