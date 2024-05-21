// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archeived_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArcheivedCardModel _$ArcheivedCardModelFromJson(Map<String, dynamic> json) =>
    ArcheivedCardModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      archiveCards: (json['results'] as List<dynamic>?)
          ?.map((e) => ArcheivedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArcheivedCardModelToJson(ArcheivedCardModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.archiveCards,
    };
