import 'package:json_annotation/json_annotation.dart';

part 'create_reminder_model.g.dart';

@JsonSerializable()
class CreateReminderModel {
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  String? message;
  String? venue;
  String? occation;
  String? date;
  String? time;
  @JsonKey(name: 'connection_id')
  int? connectionId;
  @JsonKey(name: 'card_id')
  int? cardId;
  int? id;

  CreateReminderModel({
    this.meetingLabel,
    this.message,
    this.venue,
    this.occation,
    this.date,
    this.time,
    this.connectionId,
    this.cardId,
    this.id,
  });

  factory CreateReminderModel.fromJson(Map<String, dynamic> json) {
    return _$CreateReminderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateReminderModelToJson(this);
}
