// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macho_meter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachoMeterModel _$MachoMeterModelFromJson(Map<String, dynamic> json) =>
    MachoMeterModel(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MachoMeterModelToJson(MachoMeterModel instance) =>
    <String, dynamic>{
      '_id':instance.id,
      'question': instance.question,
      'answers': instance.answers,
    };
