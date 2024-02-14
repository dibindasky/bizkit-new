// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accolade _$AccoladeFromJson(Map<String, dynamic> json) => Accolade(
      id: json['id'] as int?,
      accoladesImage: json['accolades_image'] as String?,
      accolades: json['accolades'] as String?,
      accoladesDescription: json['accolades_description'] as String?,
    );

Map<String, dynamic> _$AccoladeToJson(Accolade instance) => <String, dynamic>{
      'id': instance.id,
      'accolades_image': instance.accoladesImage,
      'accolades': instance.accolades,
      'accolades_description': instance.accoladesDescription,
    };
