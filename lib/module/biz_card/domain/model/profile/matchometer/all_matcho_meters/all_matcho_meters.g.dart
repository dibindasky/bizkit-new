// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_matcho_meters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMatchoMeters _$AllMatchoMetersFromJson(Map<String, dynamic> json) =>
    AllMatchoMeters(
      matchoMeter: (json['matcho_meter'] as List<dynamic>?)
          ?.map((e) => MatchoMeter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllMatchoMetersToJson(AllMatchoMeters instance) =>
    <String, dynamic>{
      'matcho_meter': instance.matchoMeter,
    };
