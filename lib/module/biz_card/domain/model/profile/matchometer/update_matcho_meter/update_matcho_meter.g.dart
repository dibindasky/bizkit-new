// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_matcho_meter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMatchoMeter _$UpdateMatchoMeterFromJson(Map<String, dynamic> json) =>
    UpdateMatchoMeter(
      questionId: json['question_id'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateMatchoMeterToJson(UpdateMatchoMeter instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'answers': instance.answers,
    };
