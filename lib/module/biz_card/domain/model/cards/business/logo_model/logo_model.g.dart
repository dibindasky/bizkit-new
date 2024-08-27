// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoModel _$LogoModelFromJson(Map<String, dynamic> json) => LogoModel(
      businessLogo: json['business_logo'] as String?,
      logoStory: json['logo_story'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$LogoModelToJson(LogoModel instance) => <String, dynamic>{
      'business_logo': instance.businessLogo,
      'logo_story': instance.logoStory,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
    };
