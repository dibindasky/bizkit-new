// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visiting_card_details_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitingCardDetailsResponce _$VisitingCardDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    VisitingCardDetailsResponce(
      id: json['_id'] as String?,
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
      isDisabled: json['is_disabled'] as bool?,
      userId: json['user_id'] as String?,
      selfie:
          (json['selfie'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cardImage: json['card_image'] as String?,
    );

Map<String, dynamic> _$VisitingCardDetailsResponceToJson(
        VisitingCardDetailsResponce instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
      'is_disabled': instance.isDisabled,
      'user_id': instance.userId,
      'selfie': instance.selfie,
      'card_image': instance.cardImage,
    };
