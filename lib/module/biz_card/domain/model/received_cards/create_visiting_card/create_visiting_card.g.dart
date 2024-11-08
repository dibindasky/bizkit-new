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
      selfie:
          (json['selfie'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cardImage: json['card_image'] as String?,
      checkCardImage: json['checkCardImage'] as bool? ?? false,
      checkCompany: json['checkCompany'] as bool? ?? false,
      checkDesignation: json['checkDesignation'] as bool? ?? false,
      checkPhoneNumber: json['checkPhoneNumber'] as bool? ?? false,
      checkWebsite: json['checkWebsite'] as bool? ?? false,
      checkEmail: json['checkEmail'] as bool? ?? false,
      checkLocation: json['checkLocation'] as bool? ?? false,
      checkNotes: json['checkNotes'] as bool? ?? false,
      checkOccation: json['checkOccation'] as bool? ?? false,
      checkOccupation: json['checkOccupation'] as bool? ?? false,
      checkSelfie: json['checkSelfie'] as bool? ?? false,
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
      'card_image': instance.cardImage,
      'checkCardImage': instance.checkCardImage,
      'checkCompany': instance.checkCompany,
      'checkPhoneNumber': instance.checkPhoneNumber,
      'checkWebsite': instance.checkWebsite,
      'checkDesignation': instance.checkDesignation,
      'checkEmail': instance.checkEmail,
      'checkOccation': instance.checkOccation,
      'checkLocation': instance.checkLocation,
      'checkOccupation': instance.checkOccupation,
      'checkNotes': instance.checkNotes,
      'checkSelfie': instance.checkSelfie,
    };
