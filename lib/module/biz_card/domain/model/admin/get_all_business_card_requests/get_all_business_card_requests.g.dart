// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_business_card_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBusinessCardRequests _$GetAllBusinessCardRequestsFromJson(
        Map<String, dynamic> json) =>
    GetAllBusinessCardRequests(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      businesscardRequests: (json['results'] as List<dynamic>?)
          ?.map((e) => BusinessCardRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBusinessCardRequestsToJson(
        GetAllBusinessCardRequests instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.businesscardRequests,
    };
