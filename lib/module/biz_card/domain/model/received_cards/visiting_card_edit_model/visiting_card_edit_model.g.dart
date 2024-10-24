// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visiting_card_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitingCardEditModel _$VisitingCardEditModelFromJson(
        Map<String, dynamic> json) =>
    VisitingCardEditModel(
      cardId: json['card_id'] as String?,
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
      scanedImage: json['scanedImage'] as bool? ?? false,
    );

Map<String, dynamic> _$VisitingCardEditModelToJson(
        VisitingCardEditModel instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
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
      'scanedImage': instance.scanedImage,
    };
