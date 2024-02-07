// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accolade _$AccoladeFromJson(Map<String, dynamic> json) => Accolade(
      accolades: json['accolades'] as String?,
      accoladesImage: json['accolades_image'],
      accoladesDescription: json['accolades_description'] as String?,
    );

Map<String, dynamic> _$AccoladeToJson(Accolade instance) => <String, dynamic>{
      'accolades': instance.accolades,
      'accolades_image': instance.accoladesImage,
      'accolades_description': instance.accoladesDescription,
    };
