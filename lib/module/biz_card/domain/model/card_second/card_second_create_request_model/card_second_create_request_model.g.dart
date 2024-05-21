// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_second_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardSecondCreateRequestModel _$CardSecondCreateRequestModelFromJson(
        Map<String, dynamic> json) =>
    CardSecondCreateRequestModel(
      id: json['id'],
      name: json['name'] as String?,
      whereWeMet: json['where_we_met'] as String?,
      location: json['location'] as String?,
      occupation: json['occupation'] as String?,
      notes: json['notes'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      company: json['company'] as String?,
      website: json['website'] as String?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CardSecondCreateRequestModelToJson(
        CardSecondCreateRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'where_we_met': instance.whereWeMet,
      'location': instance.location,
      'occupation': instance.occupation,
      'notes': instance.notes,
      'designation': instance.designation,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'company': instance.company,
      'website': instance.website,
      'selfie': instance.selfie,
      'image': instance.image,
    };
