// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedCardModel _$SharedCardModelFromJson(Map<String, dynamic> json) =>
    SharedCardModel(
      id: json['_id'] as String?,
      sharedCardId: json['shared_card_id'] as String?,
      sharedBy: json['shared_by'] as String?,
      sharedByName: json['shared_by_name'] as String?,
      sharedByEmail: json['shared_by_email'] as String?,
      sharedByProfilePicture: json['shared_by_profile_picture'] as String?,
      sharedAt: json['shared_at'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SharedCardModelToJson(SharedCardModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shared_card_id': instance.sharedCardId,
      'shared_by': instance.sharedBy,
      'shared_by_name': instance.sharedByName,
      'shared_by_email': instance.sharedByEmail,
      'shared_by_profile_picture': instance.sharedByProfilePicture,
      'shared_at': instance.sharedAt,
      'status': instance.status,
    };
