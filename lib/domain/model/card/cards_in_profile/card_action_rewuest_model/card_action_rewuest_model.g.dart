// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_action_rewuest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardActionRequestModel _$CardActionRequestModelFromJson(
        Map<String, dynamic> json) =>
    CardActionRequestModel(
      isArchived: json['is_archived'] as bool?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$CardActionRequestModelToJson(
        CardActionRequestModel instance) =>
    <String, dynamic>{
      'is_archived': instance.isArchived,
      'is_active': instance.isActive,
    };
