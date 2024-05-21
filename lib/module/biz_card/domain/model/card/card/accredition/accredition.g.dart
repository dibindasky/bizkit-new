// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accredition _$AccreditionFromJson(Map<String, dynamic> json) => Accredition(
      id: json['id'] as int?,
      images: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String?,
      description: json['description'] as String?,
      cardId: json['card_id'] as int?,
      date: json['date'] as String?,
      event: json['event'] as String?,
    );

Map<String, dynamic> _$AccreditionToJson(Accredition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.images,
      'label': instance.label,
      'date': instance.date,
      'description': instance.description,
      'event': instance.event,
      'card_id': instance.cardId,
    };
