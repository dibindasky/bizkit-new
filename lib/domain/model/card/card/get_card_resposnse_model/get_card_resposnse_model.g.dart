// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_resposnse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardResposnseModel _$GetCardResposnseModelFromJson(
        Map<String, dynamic> json) =>
    GetCardResposnseModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardResposnseModelToJson(
        GetCardResposnseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
