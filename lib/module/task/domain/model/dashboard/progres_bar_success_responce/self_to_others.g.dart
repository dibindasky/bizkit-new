// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_to_others.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfToOthers _$SelfToOthersFromJson(Map<String, dynamic> json) => SelfToOthers(
      all: json['all'] as int?,
      progressing: json['progressing'] as int?,
      killed: json['killed'] as int?,
      deadlineOver: json['deadline_over'] as int?,
      completed: json['completed'] as int?,
    );

Map<String, dynamic> _$SelfToOthersToJson(SelfToOthers instance) =>
    <String, dynamic>{
      'all': instance.all,
      'progressing': instance.progressing,
      'killed': instance.killed,
      'deadline_over': instance.deadlineOver,
      'completed': instance.completed,
    };
