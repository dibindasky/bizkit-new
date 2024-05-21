// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deleted_second_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeletedSecondCards _$GetDeletedSecondCardsFromJson(
        Map<String, dynamic> json) =>
    GetDeletedSecondCards(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      secondCards: (json['results'] as List<dynamic>?)
          ?.map((e) => SecondCardNew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDeletedSecondCardsToJson(
        GetDeletedSecondCards instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.secondCards,
    };
