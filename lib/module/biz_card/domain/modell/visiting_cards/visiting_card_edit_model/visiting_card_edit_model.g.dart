// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visiting_card_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitingCardEditModel _$VisitingCardEditModelFromJson(
        Map<String, dynamic> json) =>
    VisitingCardEditModel(
      cardId: json['card_id'] as String?,
      designation: json['designation'] as String?,
      phoneNumber: json['phone_number'] as String?,
      notes: json['notes'] as String?,
      selfie: json['selfie'] as String?,
    );

Map<String, dynamic> _$VisitingCardEditModelToJson(
        VisitingCardEditModel instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'designation': instance.designation,
      'phone_number': instance.phoneNumber,
      'notes': instance.notes,
      'selfie': instance.selfie,
    };
