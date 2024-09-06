// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_shared_fields_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualSharedFieldsResponce _$IndividualSharedFieldsResponceFromJson(
        Map<String, dynamic> json) =>
    IndividualSharedFieldsResponce(
      bizcardId: json['bizcard_id'] as String?,
      sharedFields: json['shared_fields'] == null
          ? null
          : IndividualSharedFields.fromJson(
              json['shared_fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndividualSharedFieldsResponceToJson(
        IndividualSharedFieldsResponce instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'shared_fields': instance.sharedFields,
    };
