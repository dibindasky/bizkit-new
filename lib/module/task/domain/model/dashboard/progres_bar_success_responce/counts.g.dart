// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counts _$CountsFromJson(Map<String, dynamic> json) => Counts(
      selfToSelf: json['self_to_self'] == null
          ? null
          : SelfToSelf.fromJson(json['self_to_self'] as Map<String, dynamic>),
      selfToOthers: json['self_to_others'] == null
          ? null
          : SelfToOthers.fromJson(
              json['self_to_others'] as Map<String, dynamic>),
      othersToSelf: json['others_to_self'] == null
          ? null
          : OthersToSelf.fromJson(
              json['others_to_self'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountsToJson(Counts instance) => <String, dynamic>{
      'self_to_self': instance.selfToSelf,
      'self_to_others': instance.selfToOthers,
      'others_to_self': instance.othersToSelf,
    };
