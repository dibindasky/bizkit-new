// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDetailsImages _$PersonalDetailsImagesFromJson(
        Map<String, dynamic> json) =>
    PersonalDetailsImages(
      personalDetailsId: json['personal_details_id'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonalDetailsImagesToJson(
        PersonalDetailsImages instance) =>
    <String, dynamic>{
      'personal_details_id': instance.personalDetailsId,
      'photos': instance.photos,
    };
