// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_archive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardArchiveModel _$CardArchiveModelFromJson(Map<String, dynamic> json) =>
    CardArchiveModel(
      bizcardId: json['bizcard_id'] as String?,
      isArchived: json['is_archived'] as bool?,
    );

Map<String, dynamic> _$CardArchiveModelToJson(CardArchiveModel instance) =>
    <String, dynamic>{
      'bizcard_id': instance.bizcardId,
      'is_archived': instance.isArchived,
    };
