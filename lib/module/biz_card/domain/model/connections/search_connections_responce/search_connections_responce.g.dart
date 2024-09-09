// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_connections_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConnectionsResponce _$SearchConnectionsResponceFromJson(
        Map<String, dynamic> json) =>
    SearchConnectionsResponce(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ConnectionsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchConnectionsResponceToJson(
        SearchConnectionsResponce instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
