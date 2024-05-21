// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_second_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllSecondCardModel _$GetAllSecondCardModelFromJson(
        Map<String, dynamic> json) =>
    GetAllSecondCardModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SecondCardNew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllSecondCardModelToJson(
        GetAllSecondCardModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
