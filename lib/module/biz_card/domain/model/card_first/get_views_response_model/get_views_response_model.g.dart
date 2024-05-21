// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_views_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetViewsResponseModel _$GetViewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetViewsResponseModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UserView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetViewsResponseModelToJson(
        GetViewsResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
