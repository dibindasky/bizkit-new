// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetailModel _$CardDetailModelFromJson(Map<String, dynamic> json) =>
    CardDetailModel(
      matchoMeter: (json['matcho_meter_comparison'] as List<dynamic>?)
          ?.map(
              (e) => MatchoMeterComparison.fromJson(e as Map<String, dynamic>))
          .toList(),
      selfie:
          (json['selfie'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notes: json['notes'] as String?,
      occasion: json['occasion'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
      completionLevel: json['completion_level'] as int?,
      isDefault: json['is_default'] as bool?,
      isBusinessEditable: json['is_business_editable'] as bool?,
      isArchived: json['is_archived'] as bool?,
      isDisabled: json['is_disabled'] as bool?,
      qrCode: json['qr_code'] as String?,
      universalLink: json['universal_link'] as String?,
      connectionId: json['connection_id'] as String?,
    );

Map<String, dynamic> _$CardDetailModelToJson(CardDetailModel instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'completion_level': instance.completionLevel,
      'is_default': instance.isDefault,
      'is_business_editable': instance.isBusinessEditable,
      'is_archived': instance.isArchived,
      'is_disabled': instance.isDisabled,
      'qr_code': instance.qrCode,
      'notes': instance.notes,
      'occasion': instance.occasion,
      'location': instance.location,
      'category': instance.category,
      'selfie': instance.selfie,
      'matcho_meter_comparison': instance.matchoMeter,
      'connection_id': instance.connectionId,
      'universal_link': instance.universalLink,
    };
