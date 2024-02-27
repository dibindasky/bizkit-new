// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brochure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrochureCreate _$BrochureCreateFromJson(Map<String, dynamic> json) =>
    BrochureCreate(
      file: json['file'],
      label: json['label'] as String?,
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$BrochureCreateToJson(BrochureCreate instance) =>
    <String, dynamic>{
      'file': instance.file,
      'label': instance.label,
      'image': instance.image,
    };
