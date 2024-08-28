// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visiting_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitingCard _$VisitingCardFromJson(Map<String, dynamic> json) => VisitingCard(
    name: json['name'] as String?,
    company: json['company'] as String?,
    designation: json['designation'] as String?,
    notes: json['notes'] as String?,
    selfie: json['selfie'] as String?,
    cardImage: json['card_image'] as String?,
    id: json['_id'] as String?);

Map<String, dynamic> _$VisitingCardToJson(VisitingCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'company': instance.company,
      'designation': instance.designation,
      'notes': instance.notes,
      'selfie': instance.selfie,
      '_id': instance.id,
      'card_image': instance.cardImage
    };
