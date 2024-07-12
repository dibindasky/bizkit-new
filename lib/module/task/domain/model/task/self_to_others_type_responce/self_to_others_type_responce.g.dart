// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_to_others_type_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfToOthersTypeResponce _$SelfToOthersTypeResponceFromJson(
        Map<String, dynamic> json) =>
    SelfToOthersTypeResponce(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelfToOthersTypeResponceToJson(
        SelfToOthersTypeResponce instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
