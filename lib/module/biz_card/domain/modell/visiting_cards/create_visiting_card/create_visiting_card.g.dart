// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_visiting_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVisitingCard _$CreateVisitingCardFromJson(Map<String, dynamic> json) =>
    CreateVisitingCard(
      name: json['name'] as String?,
      company: json['company'] as String?,
      phoneNumber: json['phone_number'] as String?,
      website: json['website'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      occation: json['occation'] as String?,
      location: json['location'] as String?,
      occupation: json['occupation'] as String?,
      notes: json['notes'] as String?,
      selfie: json['selfie'] as String?,
    );

Map<String, dynamic> _$CreateVisitingCardToJson(CreateVisitingCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'company': instance.company,
      'phone_number': instance.phoneNumber,
      'website': instance.website,
      'designation': instance.designation,
      'email': instance.email,
      'occation': instance.occation,
      'location': instance.location,
      'occupation': instance.occupation,
      'notes': instance.notes,
      'selfie': instance.selfie,
    };
