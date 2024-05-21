// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_request_list_responsemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRequestListResponsemodel _$GetRequestListResponsemodelFromJson(
        Map<String, dynamic> json) =>
    GetRequestListResponsemodel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRequestListResponsemodelToJson(
        GetRequestListResponsemodel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
