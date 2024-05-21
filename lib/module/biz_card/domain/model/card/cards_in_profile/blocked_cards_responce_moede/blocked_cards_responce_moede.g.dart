// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_cards_responce_moede.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedCardsResponceMoede _$BlockedCardsResponceMoedeFromJson(
        Map<String, dynamic> json) =>
    BlockedCardsResponceMoede(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      deletedCards: (json['results'] as List<dynamic>?)
          ?.map((e) => DeletedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockedCardsResponceMoedeToJson(
        BlockedCardsResponceMoede instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.deletedCards,
    };
