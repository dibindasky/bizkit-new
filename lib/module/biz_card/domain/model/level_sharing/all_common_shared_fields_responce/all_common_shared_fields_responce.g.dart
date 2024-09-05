// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_common_shared_fields_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCommonSharedFieldsResponce _$AllCommonSharedFieldsResponceFromJson(
        Map<String, dynamic> json) =>
    AllCommonSharedFieldsResponce(
      sharedFields: json['shared_fields'] == null
          ? null
          : SharedFields.fromJson(
              json['shared_fields'] as Map<String, dynamic>),
      applicableToIndividual: json['applicable_to_individual'] as bool?,
    );

Map<String, dynamic> _$AllCommonSharedFieldsResponceToJson(
        AllCommonSharedFieldsResponce instance) =>
    <String, dynamic>{
      'shared_fields': instance.sharedFields,
      'applicable_to_individual': instance.applicableToIndividual,
    };
