// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'others_to_self.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OthersToSelf _$OthersToSelfFromJson(Map<String, dynamic> json) => OthersToSelf(
      all: json['all'] as int?,
      progressing: json['progressing'] as int?,
      killed: json['killed'] as int?,
      deadlineOver: json['deadline_over'] as int?,
      completed: json['completed'] as int?,
    );

Map<String, dynamic> _$OthersToSelfToJson(OthersToSelf instance) =>
    <String, dynamic>{
      'all': instance.all,
      'progressing': instance.progressing,
      'killed': instance.killed,
      'deadline_over': instance.deadlineOver,
      'completed': instance.completed,
    };
