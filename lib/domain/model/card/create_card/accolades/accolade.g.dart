// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccoladeCreate _$AccoladeCreateFromJson(Map<String, dynamic> json) =>
    AccoladeCreate(
      accolades: json['accolades'] as String?,
      accoladesImage: json['accolades_image'],
      accoladesDescription: json['accolades_description'] as String?,
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$AccoladeCreateToJson(AccoladeCreate instance) =>
    <String, dynamic>{
      'accolades': instance.accolades,
      'accolades_image': instance.accoladesImage,
      'accolades_description': instance.accoladesDescription,
      'card_id': instance.cardId,
    };
