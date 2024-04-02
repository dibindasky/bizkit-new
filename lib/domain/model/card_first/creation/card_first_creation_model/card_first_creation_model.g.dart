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
      photos: json['photos'] as String?,
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
    };
