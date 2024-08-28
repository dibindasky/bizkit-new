// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brochure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brochure _$BrochureFromJson(Map<String, dynamic> json) => Brochure(
      title: json['title'] as String?,
      file: json['file'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$BrochureToJson(Brochure instance) => <String, dynamic>{
      'title': instance.title,
      'file': instance.file,
      '_id': instance.id,
    };
