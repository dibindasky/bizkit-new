// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accolade_image_adding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccoladeImageAddingModel _$AccoladeImageAddingModelFromJson(
        Map<String, dynamic> json) =>
    AccoladeImageAddingModel(
      accoladeId: json['accolade_id'] as int?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccoladeImageAddingModelToJson(
        AccoladeImageAddingModel instance) =>
    <String, dynamic>{
      'accolade_id': instance.accoladeId,
      'image': instance.image,
    };
