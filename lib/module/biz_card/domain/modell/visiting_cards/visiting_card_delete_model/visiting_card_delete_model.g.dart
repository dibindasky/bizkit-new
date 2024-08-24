// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visiting_card_delete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitingCardDeleteModel _$VisitingCardDeleteModelFromJson(
        Map<String, dynamic> json) =>
    VisitingCardDeleteModel(
      cardId: json['card_id'] as String?,
      isDisabled: json['is_disabled'] as bool?,
    );

Map<String, dynamic> _$VisitingCardDeleteModelToJson(
        VisitingCardDeleteModel instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'is_disabled': instance.isDisabled,
    };
