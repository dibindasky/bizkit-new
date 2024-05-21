// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDatum _$CardDatumFromJson(Map<String, dynamic> json) => CardDatum(
      id: json['id'] as int?,
      designation: json['designation'] as String?,
      name: json['name'] as String?,
      photos: json['photos'],
    );

Map<String, dynamic> _$CardDatumToJson(CardDatum instance) => <String, dynamic>{
      'id': instance.id,
      'designation': instance.designation,
      'name': instance.name,
      'photos': instance.photos,
    };
