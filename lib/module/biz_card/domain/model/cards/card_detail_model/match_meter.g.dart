// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_meter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchMeter _$MatchMeterFromJson(Map<String, dynamic> json) => MatchMeter(
      matchoMeterComparison: (json['matcho_meter_comparison'] as List<dynamic>?)
          ?.map(
              (e) => MatchoMeterComparison.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchMeterToJson(MatchMeter instance) =>
    <String, dynamic>{
      'matcho_meter_comparison': instance.matchoMeterComparison,
    };
