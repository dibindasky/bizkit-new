// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_received_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllReceivedCards _$GetAllReceivedCardsFromJson(Map<String, dynamic> json) =>
    GetAllReceivedCards(
      receivedCards: (json['visiting_cards'] as List<dynamic>?)
          ?.map((e) => ReceivedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllReceivedCardsToJson(
        GetAllReceivedCards instance) =>
    <String, dynamic>{
      'visiting_cards': instance.receivedCards,
    };
