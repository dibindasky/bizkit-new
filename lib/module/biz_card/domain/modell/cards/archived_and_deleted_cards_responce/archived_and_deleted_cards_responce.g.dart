// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived_and_deleted_cards_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivedAndDeletedCardsResponce _$ArchivedAndDeletedCardsResponceFromJson(
        Map<String, dynamic> json) =>
    ArchivedAndDeletedCardsResponce(
      archivedCards: (json['archived_cards'] as List<dynamic>?)
          ?.map(
              (e) => ArchivedOrDeletedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      disabledCards: (json['disabled_cards'] as List<dynamic>?)
          ?.map(
              (e) => ArchivedOrDeletedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArchivedAndDeletedCardsResponceToJson(
        ArchivedAndDeletedCardsResponce instance) =>
    <String, dynamic>{
      'archived_cards': instance.archivedCards,
      'disabled_cards': instance.disabledCards,
    };
