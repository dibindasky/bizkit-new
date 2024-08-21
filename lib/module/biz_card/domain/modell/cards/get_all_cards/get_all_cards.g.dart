// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCards _$GetAllCardsFromJson(Map<String, dynamic> json) => GetAllCards(
      bizcards: (json['bizcards'] as List<dynamic>?)
          ?.map((e) => Bizcard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCardsToJson(GetAllCards instance) =>
    <String, dynamic>{
      'bizcards': instance.bizcards,
    };
