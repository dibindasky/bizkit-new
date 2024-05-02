// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extracted_text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtractedTextModel _$ExtractedTextModelFromJson(Map<String, dynamic> json) =>
    ExtractedTextModel(
      names:
          (json['names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      emails:
          (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      websites: (json['websites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      designations: (json['designations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExtractedTextModelToJson(ExtractedTextModel instance) =>
    <String, dynamic>{
      'names': instance.names,
      'emails': instance.emails,
      'phone_numbers': instance.phoneNumbers,
      'websites': instance.websites,
      'designations': instance.designations,
    };
