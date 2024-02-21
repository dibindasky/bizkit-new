// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponse _$CardResponseFromJson(Map<String, dynamic> json) => CardResponse(
      id: json['id'] as int?,
      qrUrl: json['qr_url'] as String?,
      photo: json['photo'] as String?,
      logo: json['logo'] as String?,
      isDefault: json['is_default'] as bool?,
      isArchived: json['is_archived'] as bool?,
      user: json['user'] as int?,
      personalDetails: json['personal_details'] as int?,
      businessDetails: json['business_details'] as int?,
      bankDetails: json['bank_details'] as int?,
    );

Map<String, dynamic> _$CardResponseToJson(CardResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qr_url': instance.qrUrl,
      'photo': instance.photo,
      'logo': instance.logo,
      'is_default': instance.isDefault,
      'is_archived': instance.isArchived,
      'user': instance.user,
      'personal_details': instance.personalDetails,
      'business_details': instance.businessDetails,
      'bank_details': instance.bankDetails,
    };
