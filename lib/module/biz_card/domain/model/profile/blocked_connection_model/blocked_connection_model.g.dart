// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedConnectionModel _$BlockedConnectionModelFromJson(
        Map<String, dynamic> json) =>
    BlockedConnectionModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => BlockedConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockedConnectionModelToJson(
        BlockedConnectionModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
