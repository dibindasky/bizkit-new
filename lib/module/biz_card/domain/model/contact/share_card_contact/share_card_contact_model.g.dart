// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_card_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareCardContactModel _$ShareCardContactModelFromJson(
        Map<String, dynamic> json) =>
    ShareCardContactModel(
      cardId: json['card_id'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => ShareCardContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShareCardContactModelToJson(
        ShareCardContactModel instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'contacts': instance.contacts?.map((e) => e.toJson()).toList(),
    };
