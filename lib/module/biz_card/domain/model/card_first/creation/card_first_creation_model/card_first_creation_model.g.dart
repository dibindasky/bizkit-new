// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_first_creation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardFirstCreationModel _$CardFirstCreationModelFromJson(
        Map<String, dynamic> json) =>
    CardFirstCreationModel(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      designation: json['designation'] as String?,
      businessCategoryId: json['business_category_id'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PersonalPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardImage: (json['card_image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardJson: json['card_extracted_data'] == null
          ? null
          : ExtractedTextModel.fromJson(
              json['card_extracted_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardFirstCreationModelToJson(
        CardFirstCreationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'designation': instance.designation,
      'business_category_id': instance.businessCategoryId,
      'photos': instance.photos,
      'card_image': instance.cardImage,
      'card_extracted_data': instance.cardJson,
    };
