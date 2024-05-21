// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accolade _$AccoladeFromJson(Map<String, dynamic> json) => Accolade(
      id: json['id'] as int?,
      images: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      accolades: json['title'] as String?,
      date: json['date'] as String?,
      event: json['event'] as String?,
      accoladesDescription: json['description'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$AccoladeToJson(Accolade instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.images,
      'title': instance.accolades,
      'date': instance.date,
      'event': instance.event,
      'description': instance.accoladesDescription,
      'card_id': instance.cardId,
    };
