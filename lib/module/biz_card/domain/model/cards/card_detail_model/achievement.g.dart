// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      event: json['event'] as String?,
      date: json['date'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'event': instance.event,
      'date': instance.date,
      '_id': instance.id,
    };
