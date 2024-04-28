// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredition_image_adding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccreditionImageAddingModel _$AccreditionImageAddingModelFromJson(
        Map<String, dynamic> json) =>
    AccreditionImageAddingModel(
      accreditionId: json['accreditation_id'] as int?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccreditionImageAddingModelToJson(
        AccreditionImageAddingModel instance) =>
    <String, dynamic>{
      'accreditation_id': instance.accreditionId,
      'image': instance.image,
    };
