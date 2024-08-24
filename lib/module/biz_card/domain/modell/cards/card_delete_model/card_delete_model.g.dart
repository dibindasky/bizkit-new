// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_delete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDeleteModel _$CardDeleteModelFromJson(Map<String, dynamic> json) =>
    CardDeleteModel(
      bizcardId: json['bizcard_id'] as String?,
      isDisabled: json['is_disabled'] as bool?,
    );

Map<String, dynamic> _$CardDeleteModelToJson(CardDeleteModel instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'is_disabled': instance.isDisabled,
    };
