// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seond_card_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondCardNew _$SecondCardNewFromJson(Map<String, dynamic> json) =>
    SecondCardNew(
      id: json['id'] as int?,
      selfie: (json['selfie'] as List<dynamic>?)
          ?.map((e) => Selfie.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      image: json['image'] as String?,
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

Map<String, dynamic> _$SecondCardNewToJson(SecondCardNew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selfie': instance.selfie,
      'name': instance.name,
      'image': instance.image,
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
