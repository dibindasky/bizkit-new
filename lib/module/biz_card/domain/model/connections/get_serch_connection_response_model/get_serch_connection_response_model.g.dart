// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_serch_connection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSerchConnectionResponseModel _$GetSerchConnectionResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSerchConnectionResponseModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => BizkitUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSerchConnectionResponseModelToJson(
        GetSerchConnectionResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
