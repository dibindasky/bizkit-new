// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_achievement_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalAchievementRequestModel _$PersonalAchievementRequestModelFromJson(
        Map<String, dynamic> json) =>
    PersonalAchievementRequestModel(
        title: json['title'] as String?,
        description: json['description'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        event: json['event'] as String?,
        date: json['date'] as String?,
        bizcardId: json['bizcard_id'] as String?,
        personalDetailsId: json['personal_details_id'] as String?,
        personalAchievementId: json['personal_achievement_id'] as String?);

Map<String, dynamic> _$PersonalAchievementRequestModelToJson(
        PersonalAchievementRequestModel instance) =>
    <String, dynamic>{
      'personal_achievement_id': instance.personalAchievementId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'event': instance.event,
      'date': instance.date,
      'bizcard_id': instance.bizcardId,
      'personal_details_id': instance.personalDetailsId,
    };
