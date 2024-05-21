// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderResponseModel _$GetReminderResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetReminderResponseModel(
      id: json['id'] as int?,
      card: json['card'] == null
          ? null
          : CardDetails.fromJson(json['card'] as Map<String, dynamic>),
      image: json['image'] as String?,
      name: json['name'] as String?,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => HistoryReminders.fromJson(e as Map<String, dynamic>))
          .toList(),
      meetingLabel: json['meeting_label'] as String?,
      message: json['message'] as String?,
      venue: json['venue'] as String?,
      occation: json['occation'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      isArchived: json['is_archived'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as int?,
      cardHolderId: json['card_holder_id'] as int?,
      cardId: json['card_id'] as int?,
      connectionId: json['connection_id'] as int?,
    );

Map<String, dynamic> _$GetReminderResponseModelToJson(
        GetReminderResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card': instance.card,
      'image': instance.image,
      'name': instance.name,
      'history': instance.history,
      'meeting_label': instance.meetingLabel,
      'message': instance.message,
      'venue': instance.venue,
      'occation': instance.occation,
      'date': instance.date,
      'time': instance.time,
      'is_archived': instance.isArchived,
      'created_at': instance.createdAt?.toIso8601String(),
      'user_id': instance.userId,
      'card_holder_id': instance.cardHolderId,
      'card_id': instance.cardId,
      'connection_id': instance.connectionId,
    };
