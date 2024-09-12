// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_connection_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConnectionResponce _$SearchConnectionResponceFromJson(
        Map<String, dynamic> json) =>
    SearchConnectionResponce(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SearchConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchConnectionResponceToJson(
        SearchConnectionResponce instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
