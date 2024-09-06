// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bizcard _$BizcardFromJson(Map<String, dynamic> json) => Bizcard(
      universalLink: json['universal_link'] as String?,
      qRLink: json['qr_code'] as String?,
      bizcardId: json['bizcard_id'] as String?,
      completionLevel: json['completion_level'] as int?,
      isDefault: json['is_default'] as bool?,
      isBusinessEditable: json['is_business_editable'] as bool?,
      isArchived: json['is_archived'] as bool?,
      designation: json['designation'] as String?,
      name: json['name'] as String?,
      views: (json['views'] as num?)?.toInt(),
      companyName: json['company_name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$BizcardToJson(Bizcard instance) => <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'universal_link': instance.universalLink,
      'qr_code': instance.qRLink,
      'completion_level': instance.completionLevel,
      'is_default': instance.isDefault,
      'is_business_editable': instance.isBusinessEditable,
      'is_archived': instance.isArchived,
      'designation': instance.designation,
      'name': instance.name,
      'views': instance.views,
      'company_name': instance.companyName,
      'logo': instance.logo,
    };
