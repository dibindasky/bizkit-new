// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matcho_meter_comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchoMeterComparison _$MatchoMeterComparisonFromJson(
        Map<String, dynamic> json) =>
    MatchoMeterComparison(
      question: json['question'] as String?,
      commonAnswers: (json['common_answers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MatchoMeterComparisonToJson(
        MatchoMeterComparison instance) =>
    <String, dynamic>{
      'question': instance.question,
      'common_answers': instance.commonAnswers,
    };
