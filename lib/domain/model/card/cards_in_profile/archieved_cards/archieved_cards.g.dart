// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archieved_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchievedCards _$ArchievedCardsFromJson(Map<String, dynamic> json) =>
    ArchievedCards(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArchievedCardsToJson(ArchievedCards instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
