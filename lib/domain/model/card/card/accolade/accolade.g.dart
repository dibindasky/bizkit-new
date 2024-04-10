// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accolade _$AccoladeFromJson(Map<String, dynamic> json) => Accolade(
      id: json['id'] as int?,
      accoladesImage: json['image'],
      accolades: json['title'] as String?,
      date: json['date'] as String?,
      accoladesDescription: json['description'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$AccoladeToJson(Accolade instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.accoladesImage,
      'title': instance.accolades,
      'date': instance.date,
      'description': instance.accoladesDescription,
      'card_id': instance.cardId,
    };
