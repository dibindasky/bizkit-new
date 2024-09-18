// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matcho_meter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchoMeterModel _$MatchoMeterModelFromJson(Map<String, dynamic> json) =>
    MatchoMeterModel(
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MatchoMeterModelToJson(MatchoMeterModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
