// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates_to_remember.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesToRemember _$DatesToRememberFromJson(Map<String, dynamic> json) =>
    DatesToRemember(
      id: json['id'] as int?,
      date: json['date'] as String?,
      label: json['label'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$DatesToRememberToJson(DatesToRemember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'label': instance.label,
      'card_id': instance.cardId,
    };
