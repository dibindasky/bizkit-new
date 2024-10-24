// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedCardsResponseModel _$SharedCardsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SharedCardsResponseModel(
      results: (json['shared_cards'] as List<dynamic>?)
          ?.map((e) => SharedCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SharedCardsResponseModelToJson(
        SharedCardsResponseModel instance) =>
    <String, dynamic>{
      'shared_cards': instance.results,
    };
