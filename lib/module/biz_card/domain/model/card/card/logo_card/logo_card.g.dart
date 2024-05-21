// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoCard _$LogoCardFromJson(Map<String, dynamic> json) => LogoCard(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
      logoStory: json['logo_story'] as String?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$LogoCardToJson(LogoCard instance) => <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'logo_story': instance.logoStory,
      'card_id': instance.cardId,
    };
