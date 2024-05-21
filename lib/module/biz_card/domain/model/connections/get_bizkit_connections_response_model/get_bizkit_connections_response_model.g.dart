// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bizkit_connections_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBizkitConnectionsResponseModel _$GetBizkitConnectionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBizkitConnectionsResponseModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => BizkitConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBizkitConnectionsResponseModelToJson(
        GetBizkitConnectionsResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
