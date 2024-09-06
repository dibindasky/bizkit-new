// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_connections_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConnectionsResponce _$MyConnectionsResponceFromJson(
        Map<String, dynamic> json) =>
    MyConnectionsResponce(
      connections: (json['connections'] as List<dynamic>?)
          ?.map((e) => MyConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyConnectionsResponceToJson(
        MyConnectionsResponce instance) =>
    <String, dynamic>{
      'connections': instance.connections,
    };
