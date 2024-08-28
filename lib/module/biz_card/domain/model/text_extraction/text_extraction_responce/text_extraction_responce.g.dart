// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_extraction_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextExtractionResponce _$TextExtractionResponceFromJson(
        Map<String, dynamic> json) =>
    TextExtractionResponce(
      extractedDetails: json['extracted_details'] == null
          ? null
          : ExtractedDetails.fromJson(
              json['extracted_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextExtractionResponceToJson(
        TextExtractionResponce instance) =>
    <String, dynamic>{
      'extracted_details': instance.extractedDetails,
    };
