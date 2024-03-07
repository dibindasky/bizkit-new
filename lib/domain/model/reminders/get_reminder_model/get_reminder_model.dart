import 'package:json_annotation/json_annotation.dart';

import 'reminders.dart';

part 'get_reminder_model.g.dart';

@JsonSerializable()
class GetReminderModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Reminders>? results;

  GetReminderModel({this.count, this.next, this.previous, this.results});

  factory GetReminderModel.fromJson(Map<String, dynamic> json) {
    return _$GetReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReminderModelToJson(this);
}
