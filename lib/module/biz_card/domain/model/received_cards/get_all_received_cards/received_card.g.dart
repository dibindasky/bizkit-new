// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedCard _$ReceivedCardFromJson(Map<String, dynamic> json) => ReceivedCard(
      name: json['name'] as String?,
      company: json['company'] as String?,
      designation: json['designation'] as String?,
      notes: json['notes'] as String?,
      selfie: json['selfie'] as String?,
      cardImage: json['card_image'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ReceivedCardToJson(ReceivedCard instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'designation': instance.designation,
      'notes': instance.notes,
      'selfie': instance.selfie,
      'card_image': instance.cardImage,
    };
