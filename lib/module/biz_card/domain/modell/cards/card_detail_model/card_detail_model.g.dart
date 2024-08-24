// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetailModel _$CardDetailModelFromJson(Map<String, dynamic> json) =>
    CardDetailModel(
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
    };
