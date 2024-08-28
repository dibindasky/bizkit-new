// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_achivement_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAchivementAddModel _$BusinessAchivementAddModelFromJson(
        Map<String, dynamic> json) =>
    BusinessAchivementAddModel(
      achievementId: json['achievement_id'] as String?,
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      event: json['event'] as String?,
      date: json['date'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$BusinessAchivementAddModelToJson(
        BusinessAchivementAddModel instance) =>
    <String, dynamic>{
      'achievement_id': instance.achievementId,
      'title': instance.title,
      'images': instance.images,
      'description': instance.description,
      'event': instance.event,
      'date': instance.date,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
    };
