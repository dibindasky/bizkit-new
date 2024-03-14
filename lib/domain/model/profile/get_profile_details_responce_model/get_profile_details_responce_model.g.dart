// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_details_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileDetailsResponceModel _$GetProfileDetailsResponceModelFromJson(
        Map<String, dynamic> json) =>
    GetProfileDetailsResponceModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfileDetailsResponceModelToJson(
        GetProfileDetailsResponceModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
