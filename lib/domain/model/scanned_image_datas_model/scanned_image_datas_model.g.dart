// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_image_datas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScannedImageDatasModel _$ScannedImageDatasModelFromJson(
        Map<String, dynamic> json) =>
    ScannedImageDatasModel(
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      emails:
          (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      websites: (json['websites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      names:
          (json['names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unKnown:
          (json['unKnown'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ScannedImageDatasModelToJson(
        ScannedImageDatasModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'emails': instance.emails,
      'websites': instance.websites,
      'names': instance.names,
      'unKnown': instance.unKnown,
    };
