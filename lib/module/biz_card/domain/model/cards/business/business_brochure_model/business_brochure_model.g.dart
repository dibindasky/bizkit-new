// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_brochure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessBrochureModel _$BusinessBrochureModelFromJson(
        Map<String, dynamic> json) =>
    BusinessBrochureModel(
      brochureId: json['brochure_id'] as String?,
      title: json['title'] as String?,
      file: json['file'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$BusinessBrochureModelToJson(
        BusinessBrochureModel instance) =>
    <String, dynamic>{
      'brochure_id': instance.brochureId,
      'title': instance.title,
      'file': instance.file,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
    };
