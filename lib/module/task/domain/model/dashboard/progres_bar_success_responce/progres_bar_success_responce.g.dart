// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progres_bar_success_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgresBarSuccessResponce _$ProgresBarSuccessResponceFromJson(
        Map<String, dynamic> json) =>
    ProgresBarSuccessResponce(
      counts: json['counts'] == null
          ? null
          : Counts.fromJson(json['counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgresBarSuccessResponceToJson(
        ProgresBarSuccessResponce instance) =>
    <String, dynamic>{
      'counts': instance.counts,
    };
