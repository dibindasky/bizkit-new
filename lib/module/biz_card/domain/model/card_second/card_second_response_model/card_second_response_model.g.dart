// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_second_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardSecondResponseModel _$CardSecondResponseModelFromJson(
        Map<String, dynamic> json) =>
    CardSecondResponseModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      whereWeMet: json['where_we_met'] as String?,
      location: json['location'] as String?,
      occupation: json['occupation'] as String?,
      notes: json['notes'] as String?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      company: json['company'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      website: json['website'] as String?,
      tag: json['tag'],
      isActive: json['is_active'] as bool?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$CardSecondResponseModelToJson(
        CardSecondResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'selfie': instance.selfie,
      'name': instance.name,
      'where_we_met': instance.whereWeMet,
      'location': instance.location,
      'occupation': instance.occupation,
      'notes': instance.notes,
      'time': instance.time,
      'date': instance.date,
      'company': instance.company,
      'designation': instance.designation,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'website': instance.website,
      'tag': instance.tag,
      'is_active': instance.isActive,
      'user_id': instance.userId,
    };