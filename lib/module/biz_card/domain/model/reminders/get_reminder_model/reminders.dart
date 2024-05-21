import 'package:json_annotation/json_annotation.dart';

part 'reminders.g.dart';

@JsonSerializable()
class Reminders {
  int? id;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  String? message;
  String? venue;
  String? name;
  String? image;
  String? occation;
  String? date;
  String? time;
  bool? archived;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_holder_id')
  int? cardHolderId;
  @JsonKey(name: 'card_id')
  int? cardId;
  @JsonKey(name: 'connection_id')
  int? connectionId;

  Reminders({
    this.id,
    this.meetingLabel,
    this.message,
    this.venue,
    this.occation,
    this.name,
    this.image,
    this.date,
    this.time,
    this.archived,
    this.createdAt,
    this.userId,
    this.cardHolderId,
    this.cardId,
    this.connectionId,
  });

  factory Reminders.fromJson(Map<String, dynamic> json) =>
      _$RemindersFromJson(json);

  Map<String, dynamic> toJson() => _$RemindersToJson(this);

  /// Creates a copy of the Reminders object with potentially modified properties.
  Reminders copyWith({
    int? id,
    String? meetingLabel,
    String? message,
    String? venue,
    String? name,
    String? image,
    String? occation,
    String? date,
    String? time,
    bool? archived,
    DateTime? createdAt,
    int? userId,
    int? cardHolderId,
    int? cardId,
    int? connectionId,
  }) {
    return Reminders(
      id: id ?? this.id,
      meetingLabel: meetingLabel ?? this.meetingLabel,
      message: message ?? this.message,
      venue: venue ?? this.venue,
      name: name ?? this.name,
      image: image ?? this.image,
      occation: occation ?? this.occation,
      date: date ?? this.date,
      time: time ?? this.time,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      cardHolderId: cardHolderId ?? this.cardHolderId,
      cardId: cardId ?? this.cardId,
      connectionId: connectionId ?? this.connectionId,
    );
  }
}
