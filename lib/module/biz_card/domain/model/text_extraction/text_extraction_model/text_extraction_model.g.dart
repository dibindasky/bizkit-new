// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_extraction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextExtractionModel _$TextExtractionModelFromJson(Map<String, dynamic> json) =>
    TextExtractionModel(
      images: json['images'] == null
          ? null
          : (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TextExtractionModelToJson(
        TextExtractionModel instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
