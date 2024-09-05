// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_common_shared_fields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommonSharedFieldsModel _$UpdateCommonSharedFieldsModelFromJson(
        Map<String, dynamic> json) =>
    UpdateCommonSharedFieldsModel(
      sharedFields: json['shared_fields'] == null
          ? null
          : SharedFields.fromJson(
              json['shared_fields'] as Map<String, dynamic>),
      applicableToIndividual: json['applicable_to_individual'] as bool?,
    );

Map<String, dynamic> _$UpdateCommonSharedFieldsModelToJson(
        UpdateCommonSharedFieldsModel instance) =>
    <String, dynamic>{
      'shared_fields': instance.sharedFields,
      'applicable_to_individual': instance.applicableToIndividual,
    };
