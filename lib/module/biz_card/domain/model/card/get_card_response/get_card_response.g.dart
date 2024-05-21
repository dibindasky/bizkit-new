// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardResponse _$GetCardResponseFromJson(Map<String, dynamic> json) =>
    GetCardResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CardResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardResponseToJson(GetCardResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
