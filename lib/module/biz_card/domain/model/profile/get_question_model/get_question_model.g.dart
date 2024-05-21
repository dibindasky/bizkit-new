// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionModel _$GetQuestionModelFromJson(Map<String, dynamic> json) =>
    GetQuestionModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuestionModelToJson(GetQuestionModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
