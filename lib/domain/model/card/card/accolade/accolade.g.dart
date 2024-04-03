// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accolade _$AccoladeFromJson(Map<String, dynamic> json) => Accolade(
      id: json['id'] as int?,
      accoladesImage: json['image'] as String?,
      accolades: json['accolades'] as String?,
      accoladesDescription: json['description'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$AccoladeToJson(Accolade instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.accoladesImage,
      'accolades': instance.accolades,
      'description': instance.accoladesDescription,
      'card_id': instance.cardId,
    };
