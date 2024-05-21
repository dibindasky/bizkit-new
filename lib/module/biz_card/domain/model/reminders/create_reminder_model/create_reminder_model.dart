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

  factory CreateReminderModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReminderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReminderModelToJson(this);

  /// Creates a copy of the CreateReminderModel object with potentially modified properties.
  CreateReminderModel copyWith({
    String? meetingLabel,
    String? message,
    String? venue,
    String? occation,
    String? date,
    String? time,
    int? connectionId,
    int? cardId,
    int? id,
  }) {
    return CreateReminderModel(
      meetingLabel: meetingLabel ?? this.meetingLabel,
      message: message ?? this.message,
      venue: venue ?? this.venue,
      occation: occation ?? this.occation,
      date: date ?? this.date,
      time: time ?? this.time,
      connectionId: connectionId ?? this.connectionId,
      cardId: cardId ?? this.cardId,
      id: id ?? this.id,
    );
  }
}
