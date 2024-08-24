// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_visiting_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllVisitingCards _$GetAllVisitingCardsFromJson(Map<String, dynamic> json) =>
    GetAllVisitingCards(
      visitingCards: (json['visiting_cards'] as List<dynamic>?)
          ?.map((e) => VisitingCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllVisitingCardsToJson(
        GetAllVisitingCards instance) =>
    <String, dynamic>{
      'visiting_cards': instance.visitingCards,
    };
