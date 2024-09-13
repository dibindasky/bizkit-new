import 'package:json_annotation/json_annotation.dart';

part 'reminder_id_model.g.dart';

@JsonSerializable()
class ReminderIdModel {
  @JsonKey(name: 'reminder_id')
  String? reminderId;

  ReminderIdModel({this.reminderId});

  factory ReminderIdModel.fromJson(Map<String, dynamic> json) {
    return _$ReminderIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderIdModelToJson(this);
}
