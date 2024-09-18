// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matcho_meter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchoMeter _$MatchoMeterFromJson(Map<String, dynamic> json) => MatchoMeter(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MatchoMeterToJson(MatchoMeter instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
    };
