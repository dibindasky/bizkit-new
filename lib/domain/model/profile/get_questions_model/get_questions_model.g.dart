// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionsModel _$GetQuestionsModelFromJson(Map<String, dynamic> json) =>
    GetQuestionsModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuestionsModelToJson(GetQuestionsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
