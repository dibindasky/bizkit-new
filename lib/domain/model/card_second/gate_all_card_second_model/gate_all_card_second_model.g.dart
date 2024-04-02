// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_all_card_second_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GateAllCardSecondModel _$GateAllCardSecondModelFromJson(
        Map<String, dynamic> json) =>
    GateAllCardSecondModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SecondCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GateAllCardSecondModelToJson(
        GateAllCardSecondModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
