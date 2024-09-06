// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_views_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardViewsResponce _$GetCardViewsResponceFromJson(
        Map<String, dynamic> json) =>
    GetCardViewsResponce(
      views: (json['views'] as List<dynamic>?)
          ?.map((e) => Views.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardViewsResponceToJson(
        GetCardViewsResponce instance) =>
    <String, dynamic>{
      'views': instance.views,
    };
