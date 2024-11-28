// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived_or_deleted_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivedOrDeletedCard _$ArchivedOrDeletedCardFromJson(
        Map<String, dynamic> json) =>
    ArchivedOrDeletedCard(
      bizcardId: json['bizcard_id'] as String?,
      name: json['name'] as String?,
      companyName: json['company_name'] as String?,
      businessCategory: json['business_category'] as String?,
      designation: json['designation'] as String?,
      logo: json['logo'],
      isArchived: json['is_archived'] as bool?,
      isDisabled: json['is_disabled'] as bool?,
      deletedUserName: json['user_name'] as String?,
    );

Map<String, dynamic> _$ArchivedOrDeletedCardToJson(
        ArchivedOrDeletedCard instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'name': instance.name,
      'company_name': instance.companyName,
      'business_category': instance.businessCategory,
      'designation': instance.designation,
      'logo': instance.logo,
      'is_archived': instance.isArchived,
      'is_disabled': instance.isDisabled,
      'user_name':instance.deletedUserName
    };
