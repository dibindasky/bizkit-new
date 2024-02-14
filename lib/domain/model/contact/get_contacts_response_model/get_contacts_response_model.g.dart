// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contacts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContactsResponseModel _$GetContactsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetContactsResponseModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetContactsResponseModelToJson(
        GetContactsResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
