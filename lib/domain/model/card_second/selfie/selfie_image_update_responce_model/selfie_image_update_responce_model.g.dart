// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfie_image_update_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfieImageUpdateResponceModel _$SelfieImageUpdateResponceModelFromJson(
        Map<String, dynamic> json) =>
    SelfieImageUpdateResponceModel(
      message: json['message'] as String?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelfieImageUpdateResponceModelToJson(
        SelfieImageUpdateResponceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'selfie': instance.selfie,
    };
