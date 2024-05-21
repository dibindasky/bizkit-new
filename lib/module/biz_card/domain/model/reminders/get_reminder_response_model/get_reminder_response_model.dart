import 'package:json_annotation/json_annotation.dart';

import 'card_details.dart';
import 'history_reminders.dart';

part 'get_reminder_response_model.g.dart';

@JsonSerializable()
class GetReminderResponseModel {
  int? id;
  CardDetails? card;
  String? image;
  String? name;
  List<HistoryReminders>? history;
  @JsonKey(name: 'meeting_label')
  String? meetingLabel;
  String? message;
  String? venue;
  String? occation;
  String? date;
  String? time;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
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

  GetReminderResponseModel({
    this.id,
    this.card,
    this.image,
    this.name,
    this.history,
    this.meetingLabel,
    this.message,
    this.venue,
    this.occation,
    this.date,
    this.time,
    this.isArchived,
    this.createdAt,
    this.userId,
    this.cardHolderId,
    this.cardId,
    this.connectionId,
  });

  factory GetReminderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetReminderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReminderResponseModelToJson(this);

  GetReminderResponseModel copyWith({
    int? id,
    CardDetails? card,
    String? image,
    String? name,
    List<HistoryReminders>? history,
    String? meetingLabel,
    String? message,
    String? venue,
    String? occation,
    String? date,
    String? time,
    bool? isArchived,
    DateTime? createdAt,
    int? userId,
    int? cardHolderId,
    int? cardId,
    int? connectionId,
  }) {
    return GetReminderResponseModel(
      id: id ?? this.id,
      card: card ?? this.card,
      image: image ?? this.image,
      name: name ?? this.name,
      history: history ?? this.history?.toList(), // Deep copy for lists
      meetingLabel: meetingLabel ?? this.meetingLabel,
      message: message ?? this.message,
      venue: venue ?? this.venue,
      occation: occation ?? this.occation,
      date: date ?? this.date,
      time: time ?? this.time,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      cardHolderId: cardHolderId ?? this.cardHolderId,
      cardId: cardId ?? this.cardId,
      connectionId: connectionId ?? this.connectionId,
    );
  }
}
