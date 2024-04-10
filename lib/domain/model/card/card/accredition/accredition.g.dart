// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accredition _$AccreditionFromJson(Map<String, dynamic> json) => Accredition(
      id: json['id'] as int?,
      image: json['image'],
      label: json['label'] as String?,
      description: json['description'] as String?,
      cardId: json['card_id'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$AccreditionToJson(Accredition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'label': instance.label,
      'date': instance.date,
      'description': instance.description,
      'card_id': instance.cardId,
    };
