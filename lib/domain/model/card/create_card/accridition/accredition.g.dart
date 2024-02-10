// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accredition _$AccreditionFromJson(Map<String, dynamic> json) => Accredition(
      image: json['image'],
      label: json['label'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccreditionToJson(Accredition instance) =>
    <String, dynamic>{
      'image': instance.image,
      'label': instance.label,
      'description': instance.description,
    };
