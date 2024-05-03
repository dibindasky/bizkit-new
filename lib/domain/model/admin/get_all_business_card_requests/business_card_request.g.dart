// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessCardRequest _$BusinessCardRequestFromJson(Map<String, dynamic> json) =>
    BusinessCardRequest(
      id: json['id'] as int?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      photo: json['photo'] as String?,
      companyId: json['company_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$BusinessCardRequestToJson(
        BusinessCardRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'designation': instance.designation,
      'photo': instance.photo,
      'company_id': instance.companyId,
      'card_id': instance.cardId,
    };
