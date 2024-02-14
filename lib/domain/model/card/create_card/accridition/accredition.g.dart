// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccreditionCreate _$AccreditionCreateFromJson(Map<String, dynamic> json) =>
    AccreditionCreate(
      image: json['image'],
      label: json['label'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccreditionCreateToJson(AccreditionCreate instance) =>
    <String, dynamic>{
      'image': instance.image,
      'label': instance.label,
      'description': instance.description,
    };
