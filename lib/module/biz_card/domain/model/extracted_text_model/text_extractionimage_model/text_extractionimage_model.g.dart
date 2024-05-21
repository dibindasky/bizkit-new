// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_extractionimage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextExtractionimageModel _$TextExtractionimageModelFromJson(
        Map<String, dynamic> json) =>
    TextExtractionimageModel(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TextExtractionimageModelToJson(
        TextExtractionimageModel instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
