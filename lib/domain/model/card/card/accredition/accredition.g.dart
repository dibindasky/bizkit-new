// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accredition _$AccreditionFromJson(Map<String, dynamic> json) => Accredition(
      id: json['id'] as int?,
      image: json['image'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$AccreditionToJson(Accredition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'label': instance.label,
      'description': instance.description,
      'card_id': instance.cardId,
    };
